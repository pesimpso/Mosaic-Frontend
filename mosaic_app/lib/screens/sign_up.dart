import 'package:flutter/material.dart';
import 'package:mosaicapp/constants.dart';
import 'package:mosaicapp/models/app_data.dart';
import 'package:mosaicapp/models/login_register_data.dart';
import 'package:mosaicapp/screens/homepage.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  static const String id = '/signUp';

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  LoginRegisterData data = LoginRegisterData();
  String reenteredPW = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(children: [
          SizedBox(height: 175),
          Container(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: [
                Text(
                  'Mosaic',
                  style: kTitleStyle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Column(children: [
            Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
              child: TextField(
                enabled: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: const OutlineInputBorder(),
                  hintText: 'Username',
                ),
                style: kBodyStyleDark,
                onChanged: (String username) {
                  this.data.username = username;
                },
                /* NEED TO ADD FUNCTIONALITY */
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
              child: TextField(
                enabled: true,
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: const OutlineInputBorder(),
                  hintText: 'Password',
                ),
                style: kBodyStyleDark,
                onChanged: (String pw) {
                  this.data.password = pw;
                },
                /* NEED TO ADD FUNCTIONALITY */
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
              child: TextField(
                enabled: true,
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: const OutlineInputBorder(),
                  hintText: 'Re-enter password',
                ),
                style: kBodyStyleDark,
                onChanged: (String pw) {
                  this.reenteredPW = pw;
                },
                /* NEED TO ADD FUNCTIONALITY */
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 30,
              height: 60,
              child: RaisedButton(
                child: Text(
                  'Sign Up!',
                  style: kBodyStyle,
                ),
                color: Colors.lightBlue,
                clipBehavior: Clip.hardEdge,
                /* NEED TO ADD FUNCTIONALITY */
                onPressed: () async {
                  //Don't act if password hasn't been properly re-entered
                  if (reenteredPW != this.data.password) {
                  } else {
                    if (await Provider.of<AppData>(context, listen: false)
                        .validateRegistration(this.data)) {
                      Navigator.pushNamed(context, Homepage.id);
                    }
                  }
                },
              ),
            ),
          ]),
        ]),
      ),
    );
  }
}
