import 'package:mosaicapp/constants.dart';
import 'package:mosaicapp/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:mosaicapp/screens/businesspage.dart';
import 'package:mosaicapp/widgets/star_display.dart';

class RestaurantCarouselCard extends StatelessWidget {
  final Restaurant restaurant;

  RestaurantCarouselCard(this.restaurant);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, BusinessPage.id,
              arguments: this.restaurant);
        },
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
                  child: Image.network(
                    restaurant.imgURL,
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  restaurant.businessName,
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
                  associatedRestaurant: restaurant,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
