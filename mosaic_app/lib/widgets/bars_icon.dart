import 'package:flutter/material.dart';
import 'package:mosaicapp/constants.dart';

class BarIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      highlightColor: Colors.black,
      splashColor: Colors.black,
      child: Icon(
        Icons.local_bar,
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
