//Data-only class used by provider to share data across the app
import 'package:flutter/material.dart';
import 'package:mosaicapp/models/login_register_data.dart';

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
}
