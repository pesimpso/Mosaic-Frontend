import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:mosaicapp/models/query.dart';
import 'dart:convert';

import 'package:mosaicapp/models/restaurant.dart';

class NetworkHelper {
  final String url;

  NetworkHelper({this.url});

  Future validateLogin(String username, String pw) async {
    var response = await http.post(url,
        body: {'task': 'login', 'username': username, 'password': pw});

    String data = response.body;
    dynamic json = jsonDecode(data);
    return json['result'];
  }

  Future registerUser(String username, String pw) async {
    var response = await http.post(url,
        body: {'task': 'register', 'username': username, 'password': pw});

    String data = response.body;
    dynamic json = jsonDecode(data);
    return json['result'];
  }

  dynamic serveQuery(Query query) {
    //Handle text-based queries
    if (query.queryType == QueryType.Text) {
      return serveTextQuery(query.queryText);
    }
    //Handle categorical queries
    else if (query.queryType == QueryType.Category) {
      return serveCategoryQuery(query.queryCategory);
    }
    //Handle geospatial queries
    else if (query.queryType == QueryType.Geospatial) {
      serveGeospatialQuery(query.userPosition);
    } else {
      return null;
    }
  }

  Future serveTextQuery(String queryText) async {
    var response = await http
        .get(url, headers: {'task': 'textquery', "querytext": queryText});
    return responseToList(response);
  }

  Future serveCategoryQuery(Category category) async {
    String categoryString = category.toString();
    categoryString = categoryString.split(".")[0];

    var response = await http.get(url,
        headers: {'task': 'categoryquery', "category": categoryString});
    return responseToList(response);
  }

  Future serveGeospatialQuery(Position userPosition) async {
    String lat = userPosition.latitude.toString();
    String lng = userPosition.longitude.toString();

    var response = await http
        .get(url, headers: {'task': 'geoquery', 'lat': lat, 'lng': lng});
    return responseToList(response);
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
}
