import 'package:flutter/material.dart';
import 'package:mosaicapp/widgets/heart_icon_small.dart';
import 'package:mosaicapp/widgets/nav_bar.dart';
import 'package:mosaicapp/constants.dart';
import 'package:mosaicapp/widgets/search_bar.dart';
import 'package:mosaicapp/models/restaurant.dart';

class Results extends StatefulWidget {
  static const String id = '/results';

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Results> {
  List<Restaurant> entries = <Restaurant>[];
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
                height: 450,
                width: MediaQuery.of(context).size.width - 30,
                child: ListView(
                  padding: const EdgeInsets.only(top: 15),
                  children: <Widget>[
                    Container(
                      height: 150,
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: FlatButton(
                        color: Colors.white,
                        padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: 
                          Row(
                            children: [
                              Column(
                                children: <Widget>[
                                  SizedBox(
                                    width: 190,
                                    child: 
                                      Text(
                                        'Name',
                                        style: kHeaderStyle,
                                      ),
                                  ),
                                  SizedBox(
                                    width: 190,
                                    child: 
                                    Text(
                                      '0.8 Miles Away',
                                      style: kBodyStyleDark,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 190,
                                    child: 
                                    Text(
                                      '(123) 456-7890',
                                      style: kBodyStyleDark,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(0),
                                    child: 
                                      Row(
                                        children: [
                                          SizedBox(
                                            //Place stars here
                                          ),
                                          SizedBox(
                                            width: 29,
                                          ),
                                          HeartIconSmall(),
                                        ],
                                      ),
                                      
                                  ),
                                ],
                              ),
                              Container(
                                alignment: Alignment.topRight,
                                decoration: new BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                height: 150,
                                width: 150,
                                margin: EdgeInsets.only(left: 20)
                              )
                            ]
                          ),
                        /* NEED TO ADD FUNCTIONALITY */
                        onPressed: () {
                          //TODO Delete debugPrint and implement functionality
                          debugPrint("Restaurant button pressed");
                        },
                      ),   
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 4,
                    ),
                    Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width - 30,
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: FlatButton(
                        color: Colors.white,
                        padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: 
                          Row(
                            children: [
                              Column(
                                children: <Widget>[
                                  SizedBox(
                                    width: 190,
                                    child: 
                                      Text(
                                        'Name',
                                        style: kHeaderStyle,
                                      ),
                                  ),
                                  SizedBox(
                                    width: 190,
                                    child: 
                                    Text(
                                      '0.8 Miles Away',
                                      style: kBodyStyleDark,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 190,
                                    child: 
                                    Text(
                                      '(123) 456-7890',
                                      style: kBodyStyleDark,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(0),
                                    child: 
                                      Row(
                                        children: [
                                          SizedBox(
                                            //Place stars here
                                          ),
                                          SizedBox(
                                            width: 29,
                                          ),
                                          HeartIconSmall(),
                                        ],
                                      ),
                                      
                                  ),
                                ],
                              ),
                              Container(
                                alignment: Alignment.topRight,
                                decoration: new BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                height: 150,
                                width: 150,
                                margin: EdgeInsets.only(left: 20)
                              )
                            ]
                          ),
                        /* NEED TO ADD FUNCTIONALITY */
                        onPressed: () {
                          //TODO Delete debugPrint and implement functionality
                          debugPrint("Restaurant button pressed");
                        },
                      ),   
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 4,
                    ),
                    Container(
                      height: 150,
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: FlatButton(
                        color: Colors.white,
                        padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: 
                          Row(
                            children: [
                              Column(
                                children: <Widget>[
                                  SizedBox(
                                    width: 190,
                                    child: 
                                      Text(
                                        'Name',
                                        style: kHeaderStyle,
                                      ),
                                  ),
                                  SizedBox(
                                    width: 190,
                                    child: 
                                    Text(
                                      '0.8 Miles Away',
                                      style: kBodyStyleDark,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 190,
                                    child: 
                                    Text(
                                      '(123) 456-7890',
                                      style: kBodyStyleDark,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(0),
                                    child: 
                                      Row(
                                        children: [
                                          SizedBox(
                                            //Place stars here
                                          ),
                                          SizedBox(
                                            width: 29,
                                          ),
                                          HeartIconSmall(),
                                        ],
                                      ),
                                      
                                  ),
                                ],
                              ),
                              Container(
                                alignment: Alignment.topRight,
                                decoration: new BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                height: 150,
                                width: 150,
                                margin: EdgeInsets.only(left: 20)
                              )
                            ]
                          ),
                        /* NEED TO ADD FUNCTIONALITY */
                        onPressed: () {
                          //TODO Delete debugPrint and implement functionality
                          debugPrint("Restaurant button pressed");
                        },
                      ),   
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 4,
                    ),
                  ],
                ),
              ),
            ]),
          ),
      );
  }
}
