import 'package:flutter/material.dart';
import 'package:mosaicapp/widgets/heart_icon_small.dart';
import 'package:mosaicapp/widgets/nav_bar.dart';
import 'package:mosaicapp/constants.dart';
import 'package:mosaicapp/widgets/restaurant_result_card.dart';
import 'package:mosaicapp/widgets/search_bar.dart';
import 'package:mosaicapp/models/restaurant.dart';
import 'package:mosaicapp/widgets/sort_dropdown.dart';
import 'package:mosaicapp/widgets/star_display.dart';

class Results extends StatefulWidget {
  static const String id = '/results';

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Results> {
  final List<RestaurantResultCard> data = [
    RestaurantResultCard(
      Restaurant(
        name: 'Name',
        distFromUser: 1.2,
        rating: 3.5,
        phone: "(123) 456-7890",
        address: "123 Road St.",
      ),
    ),
    RestaurantResultCard(
      Restaurant(
        name: 'Name',
        distFromUser: 1.2,
        rating: 3.5,
        address: "123 Road St.",
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            NavBar(),
            SearchBar(),
            /* BEGIN FILTERS. NEED TO TURN INTO DROPDOWNS*/
            Container(
              margin: EdgeInsets.only(left: 15),
              //TODO Align "sort by" button with edge (only if time)
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SortDropDown(
                    name: 'Distance',
                  ),
                  SortDropDown(
                    name: 'Rating',
                  ),
                  SortDropDown(
                    name: 'Sort By',
                  )
                ],
              ),
            ),
            /* NEED TO ADD FUNCTIONALITY. */
            Container(
              margin: EdgeInsets.only(top: 15, left: 15, right: 15),
              height: 450,
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return data[index];
                },
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(height: 10),
                itemCount: data.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
