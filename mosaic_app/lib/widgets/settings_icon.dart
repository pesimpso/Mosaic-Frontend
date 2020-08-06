import 'package:flutter/material.dart';
import 'package:mosaicapp/constants.dart';

class SettingsIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Icon(
        Icons.settings,
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
