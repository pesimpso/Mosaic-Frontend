import 'package:flutter/material.dart';
import 'package:mosaicapp/models/restaurant.dart';
import 'package:mosaicapp/screens/businesspage.dart';
import 'package:mosaicapp/widgets/heart_icon.dart';
import 'package:mosaicapp/widgets/heart_icon_small.dart';
import 'package:mosaicapp/widgets/star_display.dart';

import '../constants.dart';

class RestaurantResultCard extends StatelessWidget {
  final Restaurant restaurant;

  RestaurantResultCard(this.restaurant);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //on tap, load the businesses' page
      onTap: () {
        Navigator.pushNamed(context, BusinessPage.id, arguments: restaurant);
      },
      child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restaurant.name,
                        style: kHeaderStyle,
                      ),
                      Text(
                        restaurant.distFromUser.toString() + " Miles Away",
                        maxLines: 1,
                        style: kBodyStyleDark,
                      ),
                      Text(
                        (restaurant.phone == null) ? "" : restaurant.phone,
                        style: kBodyStyleDark.copyWith(
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        (restaurant.address == null) ? "" : restaurant.address,
                        style: kBodyStyleDark,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StarDisplay(
                        rating: restaurant.rating,
                        height: 23,
                      ),
                      HeartIconSmall(
                        size: 30,
                      ),
                    ],
                  )
                ],
              )),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.grey),
                height: 150,
                width: 150,
              ),
            ],
          )),
    );
  }
}
