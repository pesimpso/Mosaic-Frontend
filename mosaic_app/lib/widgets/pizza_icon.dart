import 'package:flutter/material.dart';
import 'package:mosaicapp/constants.dart';

class PizzaIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Icon(
        Icons.local_pizza,
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
