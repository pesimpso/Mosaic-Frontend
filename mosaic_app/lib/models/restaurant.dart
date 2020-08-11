import 'package:flutter/material.dart';

class Restaurant {
  int businessID;
  String businessName;
  String businessAddress;
  String businessPhone;
  //TODO update this to be accurate
  String imgURL;

  //Stores the community rating for the restaurant
  double rating;

  //Stores the user's rating of the restaurant if it exists
  double userRating;
  double distFromUser;

  //Tracks whether the user has favorited the restaurant
  bool favorited;
  NetworkImage image;

  //Parameterized constructor
  Restaurant({
    this.distFromUser,
    this.rating,
    this.userRating,
    this.businessName,
    this.businessAddress,
    this.businessPhone,
    this.favorited,
    this.image,
  });

  Restaurant.fromJson(Map<String, dynamic> json) {
    businessID = json['businessID'];
    businessName = json['businessName'];
    businessAddress = json['businessAddress'];
    businessPhone = json['businessPhone'];
  }
}
