import 'package:flutter/material.dart';
import 'package:mosaicapp/constants.dart';
import 'package:mosaicapp/widgets/caret_icon.dart';

class Settings extends StatefulWidget {
  static const String id = '/settings';

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Row(
              children: <Widget>[
                //caret icon
                CaretIcon(),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 235,
                ),
                Text(
                  'Settings',
                  style: kTitleStyle,
                  textAlign: TextAlign.right,
                )
              ]
            ),
            Divider(
              color: Colors.white,
              thickness: 5,
            ),
          ]
        ),
      ),
    );
  }
}
