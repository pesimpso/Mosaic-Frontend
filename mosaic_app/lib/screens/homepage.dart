import 'package:flutter/material.dart';
import 'package:mosaicapp/models/restaurant.dart';
import 'package:mosaicapp/widgets/nav_bar.dart';
import 'package:mosaicapp/widgets/restaurant_carousel_display.dart';
import 'package:mosaicapp/widgets/restaurant_icon.dart';
import 'package:mosaicapp/widgets/cafe_icon.dart';
import 'package:mosaicapp/widgets/pizza_icon.dart';
import 'package:mosaicapp/widgets/bars_icon.dart';
import 'package:mosaicapp/widgets/top-rated_icon.dart';
import 'package:mosaicapp/constants.dart';
import 'package:mosaicapp/widgets/search_bar.dart';

class Homepage extends StatefulWidget {
  static const String id = '/homepage';

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //TODO Use provider to pull actual carousel lists
  List<Restaurant> carouselDummyList = [
    Restaurant(name: 'test'),
    Restaurant(name: 'test'),
    Restaurant(name: 'test'),
    Restaurant(name: 'test'),
    Restaurant(name: 'test'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(children: [
          NavBar(),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              children: [
                Text(
                  'I\'m Looking For...',
                  style: kTitleStyle,
                ),
              ],
            ),
          ),
          /* BEGIN CATEGORIES BAR */
          Padding(
            padding: EdgeInsets.all(0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: FoodIcon()),
                    Expanded(child: CafeIcon()),
                    Expanded(child: PizzaIcon()),
                    Expanded(child: BarIcon()),
                    Expanded(child: TopRatedIcon()),
                  ],
                ),
              ],
            ),
          ),
          /* BEGIN SEARCH BAR */
          SearchBar(),
          /* BEGIN FEATURED RESTAURANTS */
          Padding(
            padding: EdgeInsets.only(bottom: 15.0, left: 15.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Text(
                      'Minority-Owned\nRestaurants Nearby',
                      style: kTitleStyle,
                    ),
                  ],
                ),
                RestaurantCarouselDisplay(
                  restaurants: carouselDummyList,
                ),
                SizedBox(
                  height: 20,
                ),
                RestaurantCarouselDisplay(
                  restaurants: carouselDummyList,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
