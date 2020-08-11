import 'package:flutter/material.dart';
import 'package:mosaicapp/constants.dart';

class AccountIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Icon(
        Icons.account_circle,
        size: kIconSize,
        color: Colors.white,
      ),
      minWidth: 40,
      onPressed: () {
        Navigator.pushNamed(context, '/accountpage');
      },
    );
  }
}
