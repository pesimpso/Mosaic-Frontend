import 'package:flutter/material.dart';
import 'package:mosaicapp/models/app_data.dart';
import 'package:mosaicapp/services/user_locator.dart';
import 'package:mosaicapp/models/query.dart';
import 'package:mosaicapp/models/query_return_data.dart';
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
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  static const String id = '/homepage';

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Restaurant> l1 = List<Restaurant>();
  List<Restaurant> l2 = List<Restaurant>();

  //Master list to track geospatial query results which will then be divided among the list
  List<Restaurant> geospatialQueryResult = List<Restaurant>();

  Future fetchGeoQuery() async {
    QueryReturnData returnData =
        await Provider.of<AppData>(context, listen: false).query(Query(
            queryType: QueryType.Geospatial,
            userPosition: await Provider.of<AppData>(context, listen: false)
                .getUserLocation()));
    //If the query fails, return an empty list
    if (returnData.success == false) {
      geospatialQueryResult = List<Restaurant>();
    }
    geospatialQueryResult = returnData.result;
  }

  //Gets the geospatial query results, returns it for list display
  Future<List<Restaurant>> getCarouselList(int whichHalf) async {
    await fetchGeoQuery();
    //If a carousel is for less than one half of the list, give it nothing.
    if (whichHalf > 2 || whichHalf < 1) {
      return List<Restaurant>();
    }
    //Get geospatial results if we don't already have them
    if (geospatialQueryResult == null) {
      return List<Restaurant>();
    }

    //Once we have the data, divide it up according to whichHalf and send it back
    if (whichHalf == 1) {
      return geospatialQueryResult.sublist(
          0, geospatialQueryResult.length ~/ 2);
    } else if (whichHalf == 2) {
      return geospatialQueryResult.sublist(
          geospatialQueryResult.length ~/ 2, geospatialQueryResult.length);
    } else {
      return List<Restaurant>();
    }
  }

  Future getGeoData() async {
    List<Restaurant> l1_;
    List<Restaurant> l2_;
    l1_ = await getCarouselList(1);
    l2_ = await getCarouselList(2);
    setState(() {
      l1 = l1_;
      l2 = l2_;
    });
  }

  @override
  void initState() {
    super.initState();
    getGeoData();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<AppData>(context).setLocator(UserLocator());
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
            padding: EdgeInsets.only(bottom: 0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: [
                      Text(
                        'Minority-Owned\nRestaurants Nearby',
                        style: kTitleStyle,
                      ),
                    ],
                  ),
                ),
                RestaurantCarouselDisplay(
                  restaurants: l1,
                ),
                SizedBox(
                  height: 20,
                ),
                RestaurantCarouselDisplay(
                  restaurants: l2,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
