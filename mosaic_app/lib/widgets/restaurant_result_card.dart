import 'package:flutter/material.dart';
import 'package:mosaicapp/models/restaurant.dart';
import 'package:mosaicapp/screens/businesspage.dart';
import 'package:mosaicapp/widgets/heart_icon.dart';
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
                        restaurant.businessName,
                        style: kHeaderStyle,
                      ),
                      Text(
                        restaurant.distFromUser.toString() + " Miles Away",
                        maxLines: 1,
                        style: kBodyStyleDark,
                      ),
                      Text(
                        (restaurant.businessPhone == null)
                            ? ""
                            : restaurant.businessPhone,
                        style: kBodyStyleDark.copyWith(
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        (restaurant.businessAddress == null)
                            ? ""
                            : restaurant.businessAddress,
                        style: kBodyStyleDark,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StarDisplay(
                        associatedRestaurant: restaurant,
                        height: 23,
                      ),
                      HeartIcon(
                        associatedRestaurant: restaurant,
                        size: 30,
                      ),
                    ],
                  )
                ],
              )),
              Image.network(
                restaurant.imgURL,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              )
            ],
          )),
    );
  }
}
