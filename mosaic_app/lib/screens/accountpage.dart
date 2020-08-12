import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:mosaicapp/constants.dart';
import 'package:mosaicapp/models/restaurant.dart';
import 'package:mosaicapp/screens/businesspage.dart';
import 'package:provider/provider.dart';
import 'package:mosaicapp/models/app_data.dart';
import 'package:mosaicapp/widgets/caret_icon.dart';
import 'package:mosaicapp/widgets/heart_icon.dart';

import 'login.dart';

class AccountPage extends StatefulWidget {
  static const String id = '/accountpage';

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  List<Restaurant> favs = List<Restaurant>();

  void populateFavs() {
    String username = Provider.of<AppData>(context).username;
    LinkedHashMap<String, List<dynamic>> favsMap =
        Provider.of<AppData>(context).usernameFavoritesMap;
    if (username == null) {
      return;
    }
    if (favsMap.containsKey(username)) {
      if (favsMap[username] != null) {
        favs = favsMap[username];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    populateFavs();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(children: [
          Row(children: <Widget>[
            //caret icon
            CaretIcon(),
            SizedBox(
              width: MediaQuery.of(context).size.width - 235,
            ),
            Text(
              'Account',
              style: kTitleStyle,
              textAlign: TextAlign.right,
            )
          ]),
          Divider(
            color: Colors.white,
            thickness: 5,
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height - 153,
              width: MediaQuery.of(context).size.width - 30,
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                    child: Row(
                      children: [
                        Text(
                          'Personal Information',
                          style: kHeaderStyle,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  Text(
                    'Username: ' +
                        (Provider.of<AppData>(context).username != null
                            ? Provider.of<AppData>(context).username
                            : "NOT LOGGED IN"),
                    style: kBodyStyleDark,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 5),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        Text(
                          'Favorites',
                          style: kHeaderStyle,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  /* BEGIN FAVORITES LIST */
                  /* NEED TO ADD FUNCTIONALITY. LOOP THROUGH LIST AND GENERATE
                  CARDS ACCORDINGLY */
                  Container(
                    height: 270,
                    child: ListView.separated(
                      itemCount: favs.length,
                      itemBuilder: (BuildContext context, int idx) {
                        return Card(
                          child: InkWell(
                            splashColor: Colors.black,
                            onTap: () {
                              Navigator.pushNamed(context, BusinessPage.id,
                                  arguments: favs[idx]);
                            },
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: 40,
                                  width: 40,
                                  margin: EdgeInsets.all(5),
                                  child: Image.network(
                                    favs[idx].imgURL,
                                    height: 40,
                                    width: 40,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  favs[idx].businessName,
                                  style: kBodyStyle,
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                          color: Colors.black,
                          margin:
                              EdgeInsets.only(bottom: 10, left: 30, right: 30),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(height: 10),
                    ),
                  ),
                  SizedBox(height: 8),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Logout',
                          style: kHeaderStyle,
                        ),
                        MaterialButton(
                          child: Icon(
                            Icons.input,
                          ),
                          onPressed: () {
                            if (Provider.of<AppData>(context, listen: false)
                                .logOut()) {
                              Navigator.pushNamed(context, Login.id);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
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
