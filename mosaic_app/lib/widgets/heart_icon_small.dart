import 'package:flutter/material.dart';

class HeartIconSmall extends StatelessWidget {
  final double size;

  HeartIconSmall({this.size = 20});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Icon(
        Icons.favorite_border,
        size: size,
        color: Colors.black,
      ),
      minWidth: size,
      onPressed: () {
        //TODO Remove debugPrint and implement functionality
        //Navigator.pop(context);
        debugPrint("Pressed favorite Button");
      },
    );
  }
}
