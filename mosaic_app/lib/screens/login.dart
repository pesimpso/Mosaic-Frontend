import 'package:flutter/material.dart';
import 'package:mosaicapp/constants.dart';
import 'package:mosaicapp/models/app_data.dart';
import 'package:mosaicapp/models/login_register_data.dart';
import 'package:mosaicapp/screens/homepage.dart';
import 'package:mosaicapp/screens/sign_up.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  static const String id = '/login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginRegisterData data = LoginRegisterData();

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
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
              child: TextField(
                obscureText: true,
                enabled: true,
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
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 30,
              height: 60,
              child: RaisedButton(
                child: Text(
                  'Log in',
                  style: kBodyStyle,
                ),
                color: Colors.lightBlue,
                clipBehavior: Clip.hardEdge,
                textColor: Colors.white,
                /* NEED TO ADD FUNCTIONALITY */
                onPressed: () async {
                  if (await Provider.of<AppData>(context, listen: false)
                      .validateLogin(this.data)) {
                    Navigator.pushNamed(context, Homepage.id);
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
              child: Text(
                'Don\'t have an account?',
                style: kBodyStyle,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: MaterialButton(
                splashColor: Colors.black,
                highlightColor: Colors.black,
                child: Text(
                  'Sign Up',
                  style: kSmallLabelStyle,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, SignUp.id);
                },
              ),
            ),
            Row(children: [
              Expanded(
                child: new Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                    child: Divider(
                      color: Colors.white,
                      height: 50,
                    )),
              ),
              Text(
                'OR',
                style: kBodyStyle,
                textAlign: TextAlign.center,
              ),
              Expanded(
                child: new Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                    child: Divider(
                      color: Colors.white,
                      height: 50,
                    )),
              ),
            ]),
            Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: MaterialButton(
                splashColor: Colors.black,
                highlightColor: Colors.black,
                child: Text(
                  'Continue as Guest.',
                  style: kSmallLabelStyle,
                ),
                onPressed: () {
                  Provider.of<AppData>(context, listen: false).setGuest(true);
                  Navigator.pushNamed(context, Homepage.id);
                },
              ),
            ),
          ]),
        ]),
      ),
    );
  }
}
