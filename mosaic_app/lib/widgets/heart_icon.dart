import 'package:flutter/material.dart';
import 'package:mosaicapp/constants.dart';
import 'package:mosaicapp/models/app_data.dart';
import 'package:mosaicapp/models/restaurant.dart';
import 'package:provider/provider.dart';

class HeartIcon extends StatelessWidget {
  final double size;
  final Restaurant associatedRestaurant;
  HeartIcon({@required this.associatedRestaurant, this.size = kIconSize});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: Colors.white,
      highlightColor: Colors.white,
      child: Icon(
        Icons.favorite_border,
        size: size,
        color: Provider.of<AppData>(context).isFavorite(associatedRestaurant)
            ? Colors.redAccent
            : Colors.black,
      ),
      minWidth: size,
      onPressed: () {
        Provider.of<AppData>(context, listen: false)
            .ToggleFavorite(associatedRestaurant);
      },
    );
  }
}
