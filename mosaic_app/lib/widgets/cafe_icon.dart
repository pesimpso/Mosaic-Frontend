import 'package:flutter/material.dart';
import 'package:mosaicapp/constants.dart';
import 'package:mosaicapp/models/query.dart';
import 'package:mosaicapp/widgets/category_icon_ancestor.dart';

class CafeIcon extends CategoryIconAncestor {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      highlightColor: Colors.black,
      splashColor: Colors.black,
      child: Column(
        children: <Widget>[
          Icon(
            Icons.local_cafe,
            size: kIconSize,
            color: Colors.white,
          ),
          Text(
            'Cafes',
            style: kSmallLabelStyle,
          ),
        ],
      ),
      onPressed: () {
        super.queryCategory(context, Category.Cafes);
      },
    );
  }
}
