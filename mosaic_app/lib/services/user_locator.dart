import 'package:geolocator/geolocator.dart';

class UserLocator {
  double userLongitude;
  double userLatitude;
  Position position;

  UserLocator() {
    this.getCurrentLocation();
  }

  Future<void> getCurrentLocation(
      {LocationAccuracy locAcc = LocationAccuracy.high}) async {
    GeolocationStatus geolocationStatus =
        await Geolocator().checkGeolocationPermissionStatus();

    position = await Geolocator().getCurrentPosition(desiredAccuracy: locAcc);
    userLongitude = position.longitude;
    userLatitude = position.latitude;
  }
}
