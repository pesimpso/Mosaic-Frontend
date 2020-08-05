import 'package:flutter/material.dart';

//the following code is from https://dev.to/guimg/hyperlink-widget-on-flutter-4fa5

class Hyperlink extends StatelessWidget {
  final String _url;
  final String _text;

  Hyperlink(this._url, this._text);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text(
        _text,
        style: TextStyle(
          decoration: TextDecoration.underline,
          fontSize: 16,
          color: Colors.white,
          fontFamily: 'Josefin Sans:wght500',
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, _url);
      },
    );
  }
}