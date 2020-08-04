import 'package:flutter/material.dart';
import 'package:mosaicapp/constants.dart';

class RestaurantIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Icon(
        Icons.fastfood,
        size: kIconSize,
        color: Colors.white,
      ),
      onPressed: () {
        //TODO Delete debugPrint and implement functionality
        debugPrint("Setting Button Pressed");
      },
    );
  }
}
