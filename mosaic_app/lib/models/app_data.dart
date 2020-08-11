import 'dart:collection';
import 'dart:core';

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
  bool _guest;
  UserLocator _locator;
  bool _registerValid;
  LinkedHashMap<String, List> usernameFavoritesMap =
      LinkedHashMap<String, List>();

  //TODO sub-in real URL
  static String dummyURL = "";
  static MosaicNetworker _networker = MosaicNetworker(url: dummyURL);
  String username = null;

  AppData({bool guest}) {
    this._guest = guest;
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

  Position getUserLocation() {
    if (_locator == null) {
      return null;
    }

    return _locator.position;
  }

  void refreshUserLocation() {
    if (_locator != null) {
      _locator.getCurrentLocation();
    }
  }

  bool validateLogin(LoginRegisterData data) {
    validateLoginHelp(data);
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

  bool validateRegistration(LoginRegisterData data) {
    validateRegistrationHelp(data);
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
    _registerValid = true;
  }

  //Logs out the current user if applicable. Returns true if successful, false otherwise (if user is logged in as guest)
  bool logOut() {
    if (getGuest()) {
      return false;
    } else {
      username = null;
      return true;
    }
  }

  //TODO Delete below once networking is implemented
  List<Restaurant> dummyList = [
    Restaurant(
      businessName: 'Name1',
      distFromUser: 1.2,
      rating: 3.5,
      businessPhone: "(123) 456-7890",
      businessAddress: "123 Road St.",
    ),
    Restaurant(
      businessName: 'Name2',
      distFromUser: 1.2,
      rating: 3.5,
      businessPhone: "(123) 456-7890",
      businessAddress: "123 Road St.",
    ),
    Restaurant(
      businessName: 'Name3',
      distFromUser: 1.2,
      rating: 3.5,
      businessPhone: "(123) 456-7890",
      businessAddress: "123 Road St.",
    ),
    Restaurant(
      businessName: 'Name4',
      distFromUser: 1.2,
      rating: 3.5,
      businessPhone: "(123) 456-7890",
      businessAddress: "123 Road St.",
    ),
    Restaurant(
      businessName: 'Name5',
      distFromUser: 1.2,
      rating: 3.5,
      businessPhone: "(123) 456-7890",
      businessAddress: "123 Road St.",
    ),
  ];

  Future<Position> loadUserPosition() async {
    if (_locator == null) {
      return null;
    }

    this._locator.position = await _locator.getUserPosition();
    return this._locator.position;
  }

  QueryReturnData query(Query query) {
    QueryReturnData returnData = QueryReturnData();
    //Handle text-based queries
    if (query.queryType == QueryType.Text) {
      returnData.success = true;
      returnData.result = _networker.serveQuery(query);
      //Handle categorical queries
    } else if (query.queryType == QueryType.Category) {
      returnData.success = true;
      returnData.result = _networker.serveQuery(query);
      //Handle geospatial queries
    } else if (query.queryType == QueryType.Geospatial) {
      loadUserPosition();
      if (_locator == null || _locator.getUserPosition() == null) {
        returnData.success = false;
        returnData.result = List<Restaurant>();
      } else {
        returnData.success = true;
        returnData.result = _networker.serveQuery(query);
      }
    } else {
      return null;
    }

    return returnData;
  }
}
