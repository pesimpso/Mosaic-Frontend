import 'package:flutter/material.dart';
import 'package:mosaicapp/constants.dart';
import 'package:mosaicapp/widgets/caret_icon.dart';
import 'package:mosaicapp/widgets/heart_icon.dart';

class AccountPage extends StatefulWidget {
  static const String id = '/accountpage';

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final List<String> data = ['name', 'name', 'name'];
  @override
  Widget build(BuildContext context) {
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
                    'Username: maryowen',
                    style: kBodyStyleDark,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Password: password',
                    style: kBodyStyleDark,
                    textAlign: TextAlign.center,
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  Row(
                    children: [
                      Container(
                        child: HeartIcon(),
                        width: 60,
                      ),
                      Text(
                        'Favorites',
                        style: kHeaderStyle,
                      ),
                    ],
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
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: InkWell(
                            onTap: () {
                              //TODO Delete debugPrint and implement functionality
                              debugPrint("Restaurant button pressed");
                            },
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: 40,
                                  width: 40,
                                  margin: EdgeInsets.all(5),
                                  child: Image.asset(
                                      'assets/images/gray_square.png'),
                                ),
                                Text(
                                  'Name\n',
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
                            //TODO implement functionality
                            debugPrint("Logout button pressed");
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
