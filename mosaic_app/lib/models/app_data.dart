//Data-only class used by provider to share data across the app
import 'package:flutter/material.dart';
import 'package:mosaicapp/models/login_register_data.dart';
import 'package:mosaicapp/models/query.dart';
import 'package:mosaicapp/models/query_return_data.dart';
import 'package:mosaicapp/models/restaurant.dart';

class AppData extends ChangeNotifier {
  bool _guest;

  AppData({bool guest}) {
    this._guest = guest;
  }

  void setGuest(bool newGuestVal) {
    this._guest = newGuestVal;
    notifyListeners();
  }

  bool getGuest() {
    return this._guest;
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

  //TODO Delete below
  List<Restaurant> dummyList = [
    Restaurant(
      name: 'Name1',
      distFromUser: 1.2,
      rating: 3.5,
      phone: "(123) 456-7890",
      address: "123 Road St.",
    ),
    Restaurant(
      name: 'Name2',
      distFromUser: 1.2,
      rating: 3.5,
      phone: "(123) 456-7890",
      address: "123 Road St.",
    ),
    Restaurant(
      name: 'Name3',
      distFromUser: 1.2,
      rating: 3.5,
      phone: "(123) 456-7890",
      address: "123 Road St.",
    ),
    Restaurant(
      name: 'Name4',
      distFromUser: 1.2,
      rating: 3.5,
      phone: "(123) 456-7890",
      address: "123 Road St.",
    ),
    Restaurant(
      name: 'Name5',
      distFromUser: 1.2,
      rating: 3.5,
      phone: "(123) 456-7890",
      address: "123 Road St.",
    ),
  ];

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
      //TODO implement query behavior, return a list of restaurants
      //TODO delete hardcoded results
      returnData.success = true;
      returnData.result = dummyList;
    } else {
      return null;
    }

    return returnData;
  }
}
