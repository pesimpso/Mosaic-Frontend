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
    if (data == "true") {
      return true;
    } else {
      return false;
    }
  }

  Future registerUser(String username, String pw) async {
    convertToURLForm(username);
    convertToURLForm(pw);
    http.Response response = await http
        .get(url + '?task=register&username=' + username + '&password=' + pw);

    String data = response.body;
    if (data == "true") {
      return true;
    } else {
      return false;
    }
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

  void rate(Restaurant rest, double rating) {
    if (rest == null) {
      return;
    }
    http.get(url +
        '?task=addrating&rating=' +
        rating.toString() +
        "&business=" +
        rest.businessName);
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
    if (category.toString() == "Category.Food") {
      return 8; //Food
    } else if (category.toString() == "Category.Cafes") {
      return 2; //Coffee
    } else if (category.toString() == "Category.Pizza") {
      return 11; //Comfort
    } else if (category.toString() == "Category.Bars") {
      return 9;
    } else if (category.toString() == "Category.Top") {
      return 10;
    }
    return 1;
  }

  Future<List<Restaurant>> _serveGeospatialQuery(
      Position userPosition, List<Restaurant> result) async {
    if (userPosition == null) {
      return List<Restaurant>();
    }
    String lat = userPosition.latitude.toString();
    String lng = userPosition.longitude.toString();
    var response =
        await http.get(url + '?task=geoquery&lat=' + lat + '&lng=' + lng);
    if (response.statusCode == 200) {
      List<Restaurant> rests = responseToList(response);
      return rests;
    } else {
      return List<Restaurant>();
    }
  }

  static dynamic responseToList(var response) {
    List<Restaurant> list = List<Restaurant>();
    if (response.statusCode == 200) {
      String data = response.body;
      if (data == null || data == "") {
        return list;
      } else {
        dynamic json = jsonDecode(data);
        for (Map i in json) {
          list.add(Restaurant.fromJson(i));
        }
      }
    }
    return list;
  }

  String convertToURLForm(String toConv) {
    toConv.replaceAll(" ", "+");
    return toConv;
  }
}
