import 'package:flutter/material.dart';

class Restaurant {
  String businessName;
  String businessAddress;
  String businessPhone;

  String imgURL;
  NetworkImage _image;

  //Stores the community rating for the restaurant
  double userRating;

  //Stores the user's rating of the restaurant if it exists
  double distFromUser;

  double lat;
  double lng;

  //Parameterized constructor
  Restaurant({
    this.distFromUser,
    this.userRating,
    this.businessName,
    this.businessAddress,
    this.businessPhone,
    this.imgURL,
  });

  Restaurant.fromJson(Map<String, dynamic> json) {
    businessName = json['name'];
    businessAddress = json['location']['address1'];
    businessPhone = json['phone'];
    imgURL = json['image_url'];
    lat = json['latitude'];
    lng = json['longitude'];
    userRating = json['rating'];
  }
}
