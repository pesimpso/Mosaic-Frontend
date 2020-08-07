import 'package:flutter/material.dart';
import 'package:mosaicapp/constants.dart';

class FoodIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.all(0),
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
            'Food',
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
