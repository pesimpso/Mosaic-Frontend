import 'package:flutter/material.dart';

import '../constants.dart';

class SortDropDown extends StatefulWidget {
  String name;
  SortDropDown({this.name = ""});

  @override
  _SortDropDownState createState() => _SortDropDownState();
}

class _SortDropDownState extends State<SortDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      margin: EdgeInsets.only(right: 40),
      child: RaisedButton(
        child: Text(
          widget.name,
          style: kBodyStyleDark,
        ),
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        /* NEED TO ADD FUNCTIONALITY */
        onPressed: () {
          //TODO Delete debugPrint and implement functionality
          debugPrint("Rating dropdown pressed");
        },
      ),
    );
  }
}
