import 'package:flutter/material.dart';
import 'package:mosaicapp/constants.dart';
import 'package:mosaicapp/widgets/caret_icon.dart';
import 'package:popup_box/popup_box.dart';
import 'package:provider/provider.dart';
import 'package:mosaicapp/models/app_data.dart';
import 'package:mosaicapp/models/login_register_data.dart';

class Settings extends StatefulWidget {
  static const String id = '/settings';

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String reenteredPW = "";
  LoginRegisterData data = LoginRegisterData();

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
              'Settings',
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
              margin: EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              width: double.infinity,
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
                          'Account Settings',
                          style: kHeaderStyle,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  /* BEGIN ACCOUNT BUTTONS */
                  SizedBox(
                    width: 150,
                    height: 30,
                    child: RaisedButton(
                        child: Text(
                          'Edit username',
                          style: kBodyStyle,
                        ),
                        color: Colors.black,
                        clipBehavior: Clip.hardEdge,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        /* NEED TO ADD FUNCTIONALITY */
                        onPressed: () async {
                          await PopupBox.showPopupBox(
                              context: context,
                              button: MaterialButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                color: Colors.black,
                                child: Text(
                                  'Submit',
                                  style: kBodyStyle,
                                ),
                                onPressed: () {
                                  //provider to update username
                                  Provider.of<AppData>(context, listen: false)
                                      .changeUsername(this.data.username);
                                  Navigator.of(context).pop();
                                },
                              ),
                              willDisplayWidget: Column(children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 15.0, right: 15.0, bottom: 15.0),
                                  child: TextField(
                                    enabled: true,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: const OutlineInputBorder(),
                                      hintText: 'New username',
                                    ),
                                    style: kBodyStyleDark,
                                    onChanged: (String username) {
                                      this.data.username = username;
                                    },
                                    /* NEED TO ADD FUNCTIONALITY */
                                  ),
                                ),
                              ]));
                        }),
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    width: 150,
                    height: 30,
                    child: RaisedButton(
                      child: Text(
                        'Edit password',
                        style: kBodyStyle,
                      ),
                      color: Colors.black,
                      clipBehavior: Clip.hardEdge,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      /* NEED TO ADD FUNCTIONALITY */
                      onPressed: () async {
                        await PopupBox.showPopupBox(
                            context: context,
                            button: MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              color: Colors.black,
                              child: Text(
                                'Submit',
                                style: kBodyStyle,
                              ),
                              onPressed: () {
                                if (reenteredPW != this.data.password) {
                                } else {
                                  Navigator.of(context).pop();
                                }
                              },
                            ),
                            willDisplayWidget: Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 15.0, right: 15.0, bottom: 15.0),
                                  child: TextField(
                                    enabled: true,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: const OutlineInputBorder(),
                                      hintText: 'New password',
                                    ),
                                    style: kBodyStyleDark,
                                    onChanged: (String pw) {
                                      this.data.password = pw;
                                    },
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 15.0, right: 15.0, bottom: 15.0),
                                    child: TextField(
                                      enabled: true,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: const OutlineInputBorder(),
                                        hintText: 'Re-enter new password',
                                      ),
                                      style: kBodyStyleDark,
                                      onChanged: (String pw) {
                                        this.reenteredPW = pw;
                                      },
                                    )),
                              ],
                            ));
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(height: 2),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      children: [
                        Text(
                          'About',
                          style: kHeaderStyle,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  /* BEGIN ABOUT BUTTONS */
                  SizedBox(
                    width: 150,
                    height: 30,
                    child: RaisedButton(
                      child: Text(
                        'Terms of Use',
                        style: kBodyStyle,
                      ),
                      color: Colors.black,
                      clipBehavior: Clip.hardEdge,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      /* NEED TO ADD FUNCTIONALITY */
                      onPressed: () async {
                        await PopupBox.showPopupBox(
                            context: context,
                            button: MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              color: Colors.black,
                              child: Text(
                                'Exit',
                                style: kBodyStyle,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            willDisplayWidget: Column(
                              children: <Widget>[
                                Text(
                                  'Last updated: 08/11/2020\n\n'
                                  'Thank you for using Mosaic.\n'
                                  'By using our app, you agree that\n'
                                  'we are not to be held responsible\n'
                                  'for any issues on your part.',
                                  style: kBodyStyleDark,
                                ),
                                SizedBox(
                                  height: 30,
                                )
                              ],
                            ));
                      },
                    ),
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    width: 150,
                    height: 30,
                    child: RaisedButton(
                      child: Text(
                        'Data Policy',
                        style: kBodyStyle,
                      ),
                      color: Colors.black,
                      clipBehavior: Clip.hardEdge,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      /* NEED TO ADD FUNCTIONALITY */
                      onPressed: () async {
                        await PopupBox.showPopupBox(
                            context: context,
                            button: MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              color: Colors.black,
                              child: Text(
                                'Exit',
                                style: kBodyStyle,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            willDisplayWidget: Column(
                              children: <Widget>[
                                Text(
                                  'Last updated: 08/11/2020\n\n'
                                  'Thank you for using Mosaic.\n'
                                  'This app is a student project,\n'
                                  'and as such we do not have any\n'
                                  'advanced security measures in place.\n'
                                  'Considering that we do store your data,\n'
                                  'Sign up at your own risk.',
                                  style: kBodyStyleDark,
                                ),
                                SizedBox(
                                  height: 30,
                                )
                              ],
                            ));
                      },
                    ),
                  ),
                  SizedBox(height: 200),
                  /* BEGIN DELETE ACCOUNT BUTTON */
//                  SizedBox(
//                    width: 250,
//                    height: 50,
//                    child: RaisedButton(
//                      child: Text(
//                        'Delete Account',
//                        maxLines: 1,
//                        style: TextStyle(
//                          fontSize: 24,
//                          color: Colors.white,
//                          fontFamily: 'Josefin Sans:wght500',
//                        ),
//                      ),
//                      color: Colors.black,
//                      clipBehavior: Clip.hardEdge,
//                      shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(45),
//                      ),
//                      /* NEED TO ADD FUNCTIONALITY */
//                      onPressed: () {
//
//                        debugPrint("Delete Account button pressed");
//                      },
//                    ),
//                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
