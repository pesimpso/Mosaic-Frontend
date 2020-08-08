import 'package:flutter/material.dart';

class StarDisplay extends StatelessWidget {
  double rating;
  double height;
  Color iconColor;

  StarDisplay(
      {@required this.rating,
      this.height = 20,
      this.iconColor = Colors.black}) {
    if (rating == null) {
      rating = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: getStars(),
    );
  }

  List<Icon> getStars() {
    List<Icon> icons = List<Icon>();
    double tempRating = rating;

    //build list
    while (tempRating > 0) {
      double remainder = tempRating % 1;
      if (remainder == 0) {
        icons.add(Icon(
          Icons.star,
          color: iconColor,
          size: this.height,
        ));
      } else {
        icons.add(Icon(
          Icons.star_half,
          color: iconColor,
          size: this.height,
        ));
      }
      tempRating -= remainder;
    }

    while (icons.length < 5) {
      icons.add(Icon(
        Icons.star_border,
        color: iconColor,
        size: this.height,
      ));
    }

    return icons;
  }
}
