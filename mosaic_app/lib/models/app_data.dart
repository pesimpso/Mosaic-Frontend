import 'dart:collection';
import 'dart:core';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mosaicapp/models/login_register_data.dart';
import 'package:mosaicapp/models/query.dart';
import 'package:mosaicapp/models/query_return_data.dart';
import 'package:mosaicapp/models/restaurant.dart';
import 'package:mosaicapp/services/Networker.dart';
import 'package:mosaicapp/services/user_locator.dart';

//Data-only class used by provider to share and manipulate data across the app
class AppData extends ChangeNotifier {
  bool _guest = false;
  UserLocator _locator;
  bool _registerValid;
  LinkedHashMap<String, List> usernameFavoritesMap =
      LinkedHashMap<String, List>();

  static MosaicNetworker _networker = MosaicNetworker();
  String username = null;

  AppData() {
    this._locator = UserLocator();
  }

  bool ToggleFavorite(Restaurant toFavorite) {
    if (username == null) {
      return false;
    }
    if (!usernameFavoritesMap.containsKey(username)) {
      usernameFavoritesMap.putIfAbsent(username, () => List<Restaurant>());
      usernameFavoritesMap[username].add(toFavorite);
    } else {
      List<Restaurant> list = usernameFavoritesMap[username];
      if (list.contains(toFavorite)) {
        list.remove(toFavorite);
      } else {
        list.add(toFavorite);
      }
    }
    notifyListeners();
    return true;
  }

  bool isFavorite(Restaurant restaurant) {
    if (username == null) {
      return false;
    }
    if (usernameFavoritesMap.containsKey(username)) {
      List<Restaurant> list = usernameFavoritesMap[username];
      return list.contains(restaurant);
    } else {
      return false;
    }
  }

  void setGuest(bool newGuestVal) {
    this._guest = newGuestVal;
    notifyListeners();
  }

  bool getGuest() {
    return this._guest;
  }

  void setLocator(UserLocator locator) {
    _locator = locator;
  }

  Future<Position> getUserLocation() async {
    if (_locator == null) {
      return null;
    }

    return await _locator.getUserPosition();
  }

  void refreshUserLocation() {
    if (_locator != null) {
      _locator.getCurrentLocation();
    }
  }

  Future<bool> validateLogin(LoginRegisterData data) async {
    await validateLoginHelp(data);
    return username != null;
  }

  void validateLoginHelp(LoginRegisterData data) async {
    if (data == null) {
      return;
    }
    if (data.username == null ||
        data.username == "" ||
        data.password == null ||
        data.password == "") {
      return;
    }
    bool isValid = true;

    isValid = await _networker.validateLogin(data.username, data.password);

    if (isValid) {
      setGuest(false);
    }
    this.username = data.username;
  }

  Future<bool> validateRegistration(LoginRegisterData data) async {
    await validateRegistrationHelp(data);
    return _registerValid;
  }

  void validateRegistrationHelp(LoginRegisterData data) async {
    if (data == null) {
      _registerValid = false;
    }
    if (data.username == null ||
        data.username == "" ||
        data.password == null ||
        data.password == "") {
      _registerValid = false;
    }
    bool isValid = true;

    isValid = await _networker.registerUser(data.username, data.password);

    if (isValid) {
      setGuest(false);
    }

    this.username = data.username;
    _registerValid = true;
  }

  //Logs out the current user if applicable. Returns true if successful, false otherwise (if user is logged in as guest)
  bool logOut() {
    if (getGuest()) {
      return true;
    } else {
      username = null;
      LinkedHashMap<String, List> usernameFavoritesMap =
          LinkedHashMap<String, List>();
      return true;
    }
  }

  void changeUsername(String u) {
    if (usernameFavoritesMap.containsKey(this.username)) {
      List<Restaurant> list = usernameFavoritesMap[username];
      usernameFavoritesMap.remove(this.username);
      usernameFavoritesMap.putIfAbsent(u, () => list);
    }
  }

  bool rate(Restaurant associatedRestaurant, int rating) {
    if (username != null && associatedRestaurant != null) {
      associatedRestaurant.userRating = rating.toDouble();
      _networker.rate(associatedRestaurant, rating.toDouble());
      return true;
    } else {
      return false;
    }
  }

  Future<Position> loadUserPosition() async {
    if (_locator == null) {
      return null;
    }

    this._locator.position = await _locator.getUserPosition();
    return this._locator.position;
  }

  Future<QueryReturnData> query(Query query) async {
    QueryReturnData returnData = QueryReturnData();
    await queryHelp(query, returnData);
    Position userPos = await getUserLocation();
    for (Restaurant rest in returnData.result) {
      rest.distFromUser = calculateDistance(
          rest.lat, rest.lng, userPos.latitude, userPos.longitude);
      String dubString = rest.distFromUser.toString();
      int dotIdx = dubString.indexOf(".");
      dubString = dubString.substring(0, dotIdx + 2);
      rest.distFromUser = double.parse(dubString);
    }
    return returnData;
  }

  static double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  Future queryHelp(Query query, QueryReturnData returnData) async {
    //Handle text-based queries
    if (query.queryType == QueryType.Text) {
      returnData.success = true;
      returnData.result = await _networker.serveQuery(query);
      //Handle categorical queries
    } else if (query.queryType == QueryType.Category) {
      returnData.success = true;
      returnData.result = await _networker.serveQuery(query);
      //Handle geospatial queries
    } else if (query.queryType == QueryType.Geospatial) {
      loadUserPosition();
      if (_locator == null || _locator.getUserPosition() == null) {
        returnData.success = false;
        returnData.result = List<Restaurant>();
      } else {
        returnData.success = true;
        returnData.result = await _networker.serveQuery(query);
      }
    } else {
      return null;
    }

    return returnData;
  }
}
