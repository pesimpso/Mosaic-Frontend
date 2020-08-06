import 'package:flutter/material.dart';
import 'package:mosaicapp/widgets/nav_bar.dart';
import 'package:mosaicapp/constants.dart';
import 'package:mosaicapp/widgets/search_bar.dart';

class Results extends StatefulWidget {
  static const String id = '/results';

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Results> {
  String dropdownValue = 'One';
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
            Row(
              children: [
                Container(
                  width: 100,
                  height: 30,
                  margin: EdgeInsets.only(left: 15, right: 40),
                  child: 
                  RaisedButton(
                    child: 
                      Text(
                        'Distance', 
                        style: kBodyStyleDark,                      
                      ),
                    color: Colors.white,
                    clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      ),
                    /* NEED TO ADD FUNCTIONALITY */
                    onPressed: () {
                      //TODO Delete debugPrint and implement functionality
                      debugPrint("Distance dropdown pressed");
                    },
                  ),
                ),
                Container(
                  width: 100,
                  height: 30,
                  margin: EdgeInsets.only(right: 40),
                  child: 
                  RaisedButton(
                    child: 
                      Text(
                        'Rating', 
                        style: kBodyStyleDark,                      
                      ),
                    color: Colors.white,
                    clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      ),
                    /* NEED TO ADD FUNCTIONALITY */
                    onPressed: () {
                      //TODO Delete debugPrint and implement functionality
                      debugPrint("Rating dropdown pressed");
                    },
                  ),
                ),
                Container(
                  width: 100,
                  height: 30,
                  child: 
                  RaisedButton(
                    child: 
                      Text(
                        'Sort by...', 
                        style: kBodyStyleDark,                      
                      ),
                    color: Colors.white,
                    clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      ),
                    /* NEED TO ADD FUNCTIONALITY */
                    onPressed: () {
                      //TODO Delete debugPrint and implement functionality
                      debugPrint("Rating dropdown pressed");
                    },
                  ),
                ),
              ]),
              /* NEED TO ADD FUNCTIONALITY. LOOP THROUGH LIST AND GENERATE 
              CARDS ACCORDINGLY */
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Column(
                  children: [
                    Container(
                      height: 150,
                      alignment: Alignment.topLeft,
                      child: Card(
                        child: InkWell(
                          onTap: () {
                            //TODO Delete debugPrint and implement functionality
                            debugPrint("Restaurant button pressed");
                          },
                          child: 
                            Row(
                              children: <Widget>[
                                Text(
                                  'Name\n\n\n\n\n', 
                                  style: kBodyStyleDark,   
                                  textAlign: TextAlign.left,                   
                                ),
                                Container(
                                  alignment: Alignment.topRight,
                                  margin: EdgeInsets.all(5),
                                  child: Image.asset('assets/images/gray_square.png'),
                                ),
                              ],
                            ),
                        ),
                        color: Colors.white,
                        margin: EdgeInsets.only(bottom: 10, left: 15, right: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                ],),
              ),
            ]),
          ),
      );
  }
}
