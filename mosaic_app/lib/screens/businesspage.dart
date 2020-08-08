import 'package:flutter/material.dart';
import 'package:mosaicapp/constants.dart';
import 'package:mosaicapp/models/restaurant.dart';
import 'package:mosaicapp/widgets/heart_icon.dart';
import 'package:mosaicapp/widgets/nav_bar.dart';
import 'package:mosaicapp/widgets/caret_icon_dark.dart';

//TODO ENSURE REFACTOREED VERSION STILL HAS OK MARGINS ON OTHER SCREEN SIZES
class BusinessPage extends StatelessWidget {
  static const String id = '/businesspage';

  final Restaurant restaurant;

  BusinessPage({@required this.restaurant});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          NavBar(),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                width: double.infinity,
                decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                (restaurant.name == null)
                                    ? ""
                                    : restaurant.name,
                                style: kHeaderStyle,
                              ),
                              HeartIcon(),
                            ],
                          ),
                        ),
                        Text(
                          restaurant.distFromUser.toString() + " Miles Away",
                          style: kBodyStyleDark,
                        ),
                        Text(
                          restaurant.phone,
                          style: kBodyStyleDark,
                        ),
                        Text(
                          '123 Address St.\nLos Angeles, CA 90089',
                          style: kBodyStyleDark,
                        ),
                      ]),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ]),
      ),
    );
  }
}
