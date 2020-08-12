import 'package:flutter/material.dart';
import 'package:mosaicapp/widgets/nav_bar.dart';
import 'package:mosaicapp/widgets/restaurant_result_card.dart';
import 'package:mosaicapp/widgets/search_bar.dart';
import 'package:mosaicapp/models/restaurant.dart';
import 'package:mosaicapp/widgets/sort_dropdown.dart';

//Pass a List<Restaurant> as a Navigator argument when pushing this route
class Results extends StatefulWidget {
  static const String id = '/results';

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Results> {
  List<Restaurant> _restaurants;
  List<RestaurantResultCard> cards = List<RestaurantResultCard>();

  void constructCards() {
    for (Restaurant restaurant in _restaurants) {
      cards.add(RestaurantResultCard(restaurant));
    }
  }

  //TODO AUT0-FILL SEARCH BOX W/ PREVIOUS QUERY BY PASSING IT INTO SEARCHBAR
  @override
  Widget build(BuildContext context) {
    _restaurants = ModalRoute.of(context).settings.arguments;
    if (_restaurants == null) {
      _restaurants = List<Restaurant>();
    }
    constructCards();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            NavBar(),
            SearchBar(),
            /* BEGIN FILTERS. NEED TO TURN INTO DROPDOWNS*/
//            Container(
//              margin: EdgeInsets.only(left: 15, right: 15),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: [
//                  SortDropDown(
//                    type: SortType.Distance,
//                  ),
//                  SortDropDown(
//                    type: SortType.Rating,
//                  ),
//                  SortDropDown(
//                    type: SortType.Sort,
//                  )
//                ],
//              ),
//            ),
            /* NEED TO ADD FUNCTIONALITY. */
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 15, left: 15, right: 15),
                height: 450,
                width: double.infinity,
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return cards[index];
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(height: 10),
                  itemCount: cards.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
