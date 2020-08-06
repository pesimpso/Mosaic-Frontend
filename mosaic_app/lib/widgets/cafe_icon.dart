import 'package:flutter/material.dart';
import 'package:mosaicapp/constants.dart';

class CafeIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      highlightColor: Colors.black,
      splashColor: Colors.black,
      child: Column(
        children: <Widget>[
          Icon(
            Icons.local_cafe,
            size: kIconSize,
            color: Colors.white,
          ),
          Text(
            'Cafes',
            style: kSmallLabelStyle,
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
