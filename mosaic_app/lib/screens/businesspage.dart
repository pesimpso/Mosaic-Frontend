import 'package:flutter/material.dart';
import 'package:mosaicapp/constants.dart';
import 'package:mosaicapp/models/restaurant.dart';
import 'package:mosaicapp/widgets/heart_icon.dart';
import 'package:mosaicapp/widgets/nav_bar.dart';
import 'package:mosaicapp/widgets/caret_icon_dark.dart';

//TODO ENSURE REFACTOREED VERSION STILL HAS OK MARGINS ON OTHER SCREEN SIZES
class BusinessPage extends StatelessWidget {
  static const String id = '/businesspage';

  @override
  Widget build(BuildContext context) {
    Restaurant restaurant = ModalRoute.of(context).settings.arguments;
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
                          child: Image.network(
                            restaurant.imgURL,
                            height: 330,
                            width: 330,
                          ),
                        ),
                        Container(
                          width: 360,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Flexible(
                                child: Container(
                                  child: Text(
                                    (restaurant.businessName == null)
                                        ? ""
                                        : restaurant.businessName,
                                    style: kHeaderStyle,
                                  ),
                                ),
                              ),
                              HeartIcon(associatedRestaurant: restaurant),
                            ],
                          ),
                        ),
                        Text(
                          restaurant.distFromUser.toString() + " Miles Away",
                          style: kBodyStyleDark,
                        ),
                        Text(
                          restaurant.businessPhone,
                          style: kBodyStyleDark,
                        ),
                        Text(
                          restaurant.businessAddress,
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
