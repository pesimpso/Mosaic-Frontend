import 'package:flutter/material.dart';

class HeartIconSmall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Icon(
        Icons.favorite_border,
        size: 30,
        color: Colors.black,
      ),
      minWidth: 30,
      onPressed: () {
        //TODO Remove debugPrint and implement functionality
        Navigator.pop(context);
        debugPrint("Pressed favorite Button");
      },
    );
  }
}