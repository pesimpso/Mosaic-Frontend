import 'package:flutter/material.dart';
import 'package:mosaicapp/constants.dart';
import 'package:mosaicapp/models/app_data.dart';
import 'package:mosaicapp/models/restaurant.dart';
import 'package:provider/provider.dart';

class HeartIcon extends StatelessWidget {
  Restaurant associatedRestaurant;
  HeartIcon({@required this.associatedRestaurant});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Icon(
        Icons.favorite_border,
        size: kIconSize,
        color: Provider.of<AppData>(context).isFavorite(associatedRestaurant)
            ? Colors.redAccent
            : Colors.black,
      ),
      minWidth: 40,
      onPressed: () {
        Provider.of<AppData>(context, listen: false)
            .ToggleFavorite(associatedRestaurant);
      },
    );
  }
}
