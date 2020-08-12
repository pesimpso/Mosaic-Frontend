import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:mosaicapp/models/query.dart';
import 'dart:convert';
import 'package:mosaicapp/models/restaurant.dart';

class MosaicNetworker {
  static String url =
      "http://168.235.82.146:8080/Mosaic_Server/MosaicAPIServlet";

  MosaicNetworker();

  Future validateLogin(String username, String pw) async {
    convertToURLForm(username);
    convertToURLForm(pw);
    var response = await http
        .get(url + '?task=login&username=' + username + '&password=' + pw);

    String data = response.body;
    dynamic json = jsonDecode(data);
    return json['result'];
  }

  Future registerUser(String username, String pw) async {
    convertToURLForm(username);
    convertToURLForm(pw);
    http.Response response = await http
        .get(url + '?task=register&username=' + username + '&password=' + pw);

    String data = response.body;
    dynamic json = jsonDecode(data);
    return json['result'];
  }

  Future<List<Restaurant>> serveQuery(Query query) async {
    List<Restaurant> result = List<Restaurant>();
    //Handle text-based queries
    if (query.queryType == QueryType.Text) {
      result = await _serveTextQuery(query.queryText, result);
    }
    //Handle categorical queries
    else if (query.queryType == QueryType.Category) {
      result = await _serveCategoryQuery(query.queryCategory, result);
    }
    //Handle geospatial queries
    else if (query.queryType == QueryType.Geospatial) {
      result = await _serveGeospatialQuery(query.userPosition, result);
    }
    return result;
  }

  Future _serveTextQuery(String queryText, List<Restaurant> result) async {
    if (queryText == null || queryText == "") {
      return List<Restaurant>();
    }
    var response =
        await http.get(url + '?task=textquery&querytext=' + queryText);
    return responseToList(response);
  }

  Future _serveCategoryQuery(Category category, List<Restaurant> result) async {
    if (category == null) {
      return List<Restaurant>();
    }

    int cat = categoryToInt(category);

    http.Response response = await http
        .get(url + '?task=categoryquery&categoryString=' + cat.toString());
    return responseToList(response);
  }

  int categoryToInt(Category category) {
    //TODO IMPLEMENT ACTUAL CONVERSION HERE
    return 2;
  }

  Future _serveGeospatialQuery(
      Position userPosition, List<Restaurant> result) async {
    if (userPosition == null) {
      return List<Restaurant>();
    }
    String lat = userPosition.latitude.toString();
    String lng = userPosition.longitude.toString();

    var response = await http.post(url,
        body: json.encode({'task': 'geoquery', 'lat': lat, 'lng': lng}));
    List<Restaurant> rests = responseToList(response);
    print('here');
    for (Restaurant rest in rests) {
      print(rest.businessName);
    }
    return rests;
  }

  static dynamic responseToList(var response) {
    List<Restaurant> list = List<Restaurant>();
    if (response.statusCode == 200) {
      String data = response.body;
      dynamic json = jsonDecode(data);
      for (Map i in json) {
        list.add(Restaurant.fromJson(i));
      }
    }
    return list;
  }

  String convertToURLForm(String toConv) {
    toConv.replaceAll(" ", "+");
    return toConv;
  }
}
