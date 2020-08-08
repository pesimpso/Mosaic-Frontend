import 'package:flutter/material.dart';
import 'package:mosaicapp/constants.dart';
import 'package:mosaicapp/models/query.dart';
import 'package:mosaicapp/widgets/category_icon_ancestor.dart';

class FoodIcon extends CategoryIconAncestor {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.all(0),
      highlightColor: Colors.black,
      splashColor: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.fastfood,
            size: kIconSize,
            color: Colors.white,
          ),
          Text(
            'Food',
            style: kBodyStyle,
          ),
        ],
      ),
      onPressed: () {
        super.queryCategory(context, Category.Food);
      },
    );
  }
}
