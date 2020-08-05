import 'package:flutter/material.dart';
import 'package:mosaicapp/constants.dart';

class SettingsIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Icon(
        Icons.settings,
        size: kIconSize,
        color: Colors.white,
      ),
      minWidth: 40,
      onPressed: () {
        Navigator.pushNamed(context, '/settings');
        debugPrint("Setting Button Pressed");
      },
    );
  }
}
