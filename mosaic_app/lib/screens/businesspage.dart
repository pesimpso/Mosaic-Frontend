import 'package:flutter/material.dart';
import 'package:mosaicapp/constants.dart';
import 'package:mosaicapp/widgets/heart_icon.dart';
import 'package:mosaicapp/widgets/nav_bar.dart';
import 'package:mosaicapp/widgets/caret_icon_dark.dart';

class BusinessPage extends StatefulWidget {
  static const String id = '/businesspage';

  @override
  _BusinessPageState createState() => _BusinessPageState();
}

class _BusinessPageState extends State<BusinessPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            NavBar(),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: Container(
                height: MediaQuery.of(context).size.height - 153,
                width: MediaQuery.of(context).size.width - 30,
                decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      alignment: Alignment.topLeft,
                      child: CaretIconDark(),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      decoration: new BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      height: 250,
                      width: 330,
                    ), 
                    Container(
                      width: 360,
                      padding: EdgeInsets.only(left: 15),
                      child: 
                        Row(
                          children: <Widget>[
                            Text(
                              'Name',
                              style: kHeaderStyle,
                            ),
                            SizedBox(width: 198),
                            HeartIcon(),
                          ],
                        ),
                    ),
                    SizedBox(
                      width: 330,
                      height: 20,
                      child: 
                      Text(
                        '0.8 Miles Away',
                        style: kBodyStyleDark,
                      ),
                    ),
                    SizedBox(
                      width: 330,
                      height: 20,
                      child: 
                      Text(
                        '(123) 456-7890',
                        style: kBodyStyleDark,
                      ),
                    ),
                    SizedBox(
                      width: 330,
                      height: 40,
                      child: 
                      Text(
                        '123 Address St.\nLos Angeles, CA 90089',
                        style: kBodyStyleDark,
                      ),
                    ),
                  ]
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ]
        ),
      ),
    );
  }
}
