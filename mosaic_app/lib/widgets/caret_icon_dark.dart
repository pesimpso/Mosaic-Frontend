import 'package:flutter/material.dart';
import 'package:mosaicapp/constants.dart';

class CaretIconDark extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Icon(
        Icons.keyboard_arrow_left,
        size: kIconSize,
        color: Colors.black,
      ),
      minWidth: 40,
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
