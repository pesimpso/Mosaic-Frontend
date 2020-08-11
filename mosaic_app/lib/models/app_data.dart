import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mosaicapp/models/login_register_data.dart';
import 'package:mosaicapp/models/query.dart';
import 'package:mosaicapp/models/query_return_data.dart';
import 'package:mosaicapp/models/restaurant.dart';
import 'package:mosaicapp/services/user_locator.dart';

//Data-only class used by provider to share and manipulate data across the app
class AppData extends ChangeNotifier {
  bool _guest;
  UserLocator _locator;

  AppData({bool guest}) {
    this._guest = guest;
    this._locator = UserLocator();
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
    if (data == null) {
      return false;
    }
    if (data.username == null ||
        data.username == "" ||
        data.password == null ||
        data.password == "") {
      return false;
    }
    bool isValid = true;

    //TODO IMPLEMENT SERVER VALIDATION HERE

    if (isValid) {
      setGuest(false);
    }
    return true;
  }

  bool validateRegistration(LoginRegisterData data) {
    if (data == null) {
      return false;
    }
    if (data.username == null ||
        data.username == "" ||
        data.password == null ||
        data.password == "") {
      return false;
    }
    bool isValid = true;

    //TODO IMPLEMENT SERVER VALIDATION HERE

    if (isValid) {
      setGuest(false);
    }
    return true;
  }

  //Logs out the current user if applicable. Returns true if successful, false otherwise (if user is logged in as guest)
  bool logOut() {
    if (getGuest()) {
      return false;
    } else {
      //TODO IMPLEMENT LOGOUT BEHAVIOR HERE
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
      //TODO implement query behavior, return a list of restaurants
      //TODO delete hardcoded results
      returnData.success = true;
      returnData.result = dummyList;
      //Handle categorical queries
    } else if (query.queryType == QueryType.Category) {
      //TODO implement query behavior, return a list of restaurants
      //TODO delete hardcoded results
      returnData.success = true;
      returnData.result = dummyList;
      //Handle geospatial queries
    } else if (query.queryType == QueryType.Geospatial) {
      loadUserPosition();
      if (_locator == null || _locator.getUserPosition() == null) {
        returnData.success = false;
        returnData.result = List<Restaurant>();
      } else {
        //TODO implement query behavior, return a list of restaurants
        //TODO delete hardcoded results
        returnData.success = true;
        returnData.result = dummyList;
      }
    } else {
      return null;
    }

    return returnData;
  }
}
