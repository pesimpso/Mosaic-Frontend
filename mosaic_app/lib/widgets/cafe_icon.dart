import 'package:flutter/material.dart';
import 'package:mosaicapp/constants.dart';

class CafeIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Icon(
        Icons.local_cafe,
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
