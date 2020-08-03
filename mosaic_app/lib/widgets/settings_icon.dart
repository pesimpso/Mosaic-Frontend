import 'package:flutter/material.dart';
import 'package:mosaicapp/constants.dart';

class SettingsIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(
        Icons.settings,
        size: kIconSize,
        color: Colors.white,
      ),
      onTap: () {
        //TODO Uncomment.
        //Navigator.pushNamed(context, SettingsPage.id)
      },
    );
  }
}
