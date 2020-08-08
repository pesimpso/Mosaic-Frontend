import 'package:flutter/material.dart';
import 'package:mosaicapp/constants.dart';
import 'package:mosaicapp/models/query.dart';
import 'package:mosaicapp/widgets/category_icon_ancestor.dart';

class TopRatedIcon extends CategoryIconAncestor {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      highlightColor: Colors.black,
      splashColor: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.local_dining,
            size: kIconSize,
            color: Colors.white,
          ),
          Text(
            'Top',
            maxLines: 1,
            style: kSmallLabelStyle,
          ),
        ],
      ),
      onPressed: () {
        super.queryCategory(context, Category.Top);
      },
    );
  }
}
