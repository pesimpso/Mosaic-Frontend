import 'package:mosaicapp/constants.dart';
import 'package:mosaicapp/models/restaurant.dart';
import 'package:flutter/material.dart';

class RestaurantCarouselCard extends StatelessWidget {
  Restaurant restaurant;

  RestaurantCarouselCard(@required this.restaurant);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.white,
      child: Text(
        restaurant.name,
        style: kBodyStyleDark,
      ),
    );
  }
}
