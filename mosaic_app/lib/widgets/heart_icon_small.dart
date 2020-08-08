import 'package:flutter/material.dart';

class HeartIconSmall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Icon(
        Icons.favorite_border,
        size: 20,
        color: Colors.black,
      ),
      minWidth: 20,
      onPressed: () {
        //TODO Remove debugPrint and implement functionality
        Navigator.pop(context);
        debugPrint("Pressed favorite Button");
      },
    );
  }
}
