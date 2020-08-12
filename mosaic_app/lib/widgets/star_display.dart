import 'package:flutter/material.dart';
import 'package:mosaicapp/models/app_data.dart';
import 'package:mosaicapp/models/restaurant.dart';
import 'package:provider/provider.dart';

class StarDisplay extends StatefulWidget {
  double rating;
  double height;
  Color iconColor;
  Restaurant associatedRestaurant;

  StarDisplay(
      {@required this.associatedRestaurant,
      this.height = 20,
      this.iconColor = Colors.black}) {
    if (rating == null) {
      rating = 0;
    }
    rating = associatedRestaurant.userRating;
  }

  @override
  _StarDisplayState createState() => _StarDisplayState();
}

class _StarDisplayState extends State<StarDisplay> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: getStars(widget.associatedRestaurant),
    );
  }

  List<StarIcon> getStars(Restaurant associatedRestaurant) {
    List<StarIcon> icons = List<StarIcon>();
    double tempRating = widget.rating;
    int idx = 0;
    //build list
    while (tempRating > 0) {
      double remainder = tempRating % 1;
      if (remainder == 0) {
        icons.insert(
          0,
          StarIcon(
            associatedRestaurant: associatedRestaurant,
            idx: idx,
            tapCallback: () {
              setState(() {
                widget.rating = widget.associatedRestaurant.userRating;
              });
            },
            icon: Icon(
              Icons.star,
              color: widget.iconColor,
              size: this.widget.height,
            ),
          ),
        );
      } else {
        icons.add(
          StarIcon(
            associatedRestaurant: associatedRestaurant,
            idx: idx,
            tapCallback: () {
              setState(() {
                widget.rating = widget.associatedRestaurant.userRating;
              });
            },
            icon: Icon(
              Icons.star_half,
              color: widget.iconColor,
              size: this.widget.height,
            ),
          ),
        );
      }
      if (remainder == 0) {
        tempRating -= 1;
      } else {
        tempRating -= remainder;
      }
      idx++;
    }

    while (icons.length < 5) {
      icons.add(
        StarIcon(
          associatedRestaurant: associatedRestaurant,
          idx: idx,
          tapCallback: () {
            setState(() {
              widget.rating = widget.associatedRestaurant.userRating;
            });
          },
          icon: Icon(
            Icons.star_border,
            color: widget.iconColor,
            size: this.widget.height,
          ),
        ),
      );
      idx++;
    }

    return icons;
  }
}

class StarIcon extends StatelessWidget {
  final int idx;
  final Icon icon;
  final Restaurant associatedRestaurant;
  final Function tapCallback;
  StarIcon(
      {@required this.idx,
      @required this.icon,
      @required this.associatedRestaurant,
      @required this.tapCallback});
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<AppData>(context, listen: false)
            .rate(associatedRestaurant, idx + 1);
        tapCallback();
      },
      child: icon,
    );
  }
}
