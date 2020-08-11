import 'package:flutter/material.dart';

class Restaurant {
  String businessName;
  String businessAddress;
  String businessPhone;

  String imgURL;
  NetworkImage image;

  //Stores the community rating for the restaurant
  double rating;

  //Stores the user's rating of the restaurant if it exists
  double userRating;
  double distFromUser;

  int thumbsUp;
  int thumbsDown;

  //Parameterized constructor
  Restaurant({
    this.distFromUser,
    this.rating,
    this.userRating,
    this.businessName,
    this.businessAddress,
    this.businessPhone,
    this.image,
  });

  Restaurant.fromJson(Map<String, dynamic> json) {
    businessName = json['name'];
    businessAddress = json['location']['address1'];
    businessPhone = json['phone'];
    imgURL = json['image_url'];
    image = NetworkImage(imgURL);
    thumbsUp = json['thumbsUp'];
    thumbsDown = json['thumbsDown'];
    userRating = thumbsUp / thumbsDown;
  }
}
