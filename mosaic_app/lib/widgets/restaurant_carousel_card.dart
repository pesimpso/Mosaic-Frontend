import 'package:mosaicapp/constants.dart';
import 'package:mosaicapp/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:mosaicapp/widgets/star_display.dart';

class RestaurantCarouselCard extends StatelessWidget {
  Restaurant restaurant;

  RestaurantCarouselCard(@required this.restaurant);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.grey),
                  height: 150,
                  width: double.infinity,
                ),
              ),
              Text(
                restaurant.name,
                maxLines: 1,
                style: kBodyStyleDark.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                restaurant.distFromUser.toString() + " Miles Away",
                maxLines: 1,
                style: kBodyStyleDark,
              ),
              StarDisplay(
                rating: restaurant.rating,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
