import 'package:flutter/material.dart';
import 'package:mosaicapp/constants.dart';
import 'package:mosaicapp/widgets/account_icon.dart';
import 'package:mosaicapp/widgets/settings_icon.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(
                  width: 15,
                ),
                Text(
                  'Mosaic',
                  style: kTitleStyle,
                ),
              ],
            ),
             Container(
                child: Row(
                  children: <Widget>[
                    Expanded(child: SettingsIcon()),
                    Expanded(child: AccountIcon()),
                    SizedBox(
                      width: 25,
                    ),
                  ],
                ),
                width: 110,
              ),
          ],
        ),
        Container(
          color: Colors.white,
          width: double.infinity,
          height: 5,
        )
      ],
    );
  }
}
