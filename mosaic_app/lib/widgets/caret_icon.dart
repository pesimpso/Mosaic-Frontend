import 'package:flutter/material.dart';
import 'package:mosaicapp/constants.dart';

class CaretIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Icon(
        Icons.keyboard_arrow_left,
        size: kIconSize,
        color: Colors.white,
      ),
      minWidth: 40,
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
