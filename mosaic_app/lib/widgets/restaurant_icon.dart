import 'package:flutter/material.dart';
import 'package:mosaicapp/constants.dart';

class RestaurantIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      highlightColor: Colors.black,
      splashColor: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.fastfood,
            size: kIconSize,
            color: Colors.white,
          ),
          Text(
            'Restaurants',
            style: kBodyStyle,
          ),
        ],
      ),
      onPressed: () {
        //TODO Delete debugPrint and implement functionality
        debugPrint("Setting Button Pressed");
      },
    );
  }
}
