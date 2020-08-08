import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

class UserLocator {
  double userLongitude;
  double userLatitude;
  Position position;
  Geolocator geolocator = Geolocator();

  UserLocator() {
    this.getCurrentLocation();
  }

  Future<void> getCurrentLocation(
      {LocationAccuracy locAcc = LocationAccuracy.high}) async {
    GeolocationStatus result =
        await geolocator.checkGeolocationPermissionStatus();
    if (result == GeolocationStatus.denied) {
      position = null;
    } else {
      position = await geolocator.getCurrentPosition(desiredAccuracy: locAcc);
      userLongitude = position.longitude;
      userLatitude = position.latitude;

      debugPrint(userLatitude.toString());
      debugPrint(userLongitude.toString());
    }
  }
}
