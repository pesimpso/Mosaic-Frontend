import 'package:flutter/material.dart';
import 'package:mosaicapp/constants.dart';
import 'package:mosaicapp/widgets/hyperlink.dart';

class Login extends StatefulWidget {
  static const String id = '/login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            SizedBox(height: 175),
            Container(
              padding: EdgeInsets.all(15.0),
              child: 
              Column(
                children: [
                Text(
                  'Mosaic',
                  style: kTitleStyle,
                  textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
                  child: 
                    TextField(
                      enabled: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: const OutlineInputBorder(),
                        hintText: 'Username',                       
                      ),
                      style: kBodyStyle,
                      /* NEED TO ADD FUNCTIONALITY */
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
                    child: 
                      TextField(
                        enabled: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: const OutlineInputBorder(),
                          hintText: 'Password',    
                        ), 
                        style: kBodyStyle,
                        /* NEED TO ADD FUNCTIONALITY */
                      ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 30,
                    height: 60,
                    child: 
                      RaisedButton(
                        child: 
                          Text(
                            'Log in', 
                            style: kBodyStyle,                      
                          ),
                        color: Colors.lightBlue,
                        clipBehavior: Clip.hardEdge,
                        textColor: Colors.white,
                        /* NEED TO ADD FUNCTIONALITY */
                        onPressed: () {
                          //TODO Delete debugPrint and implement functionality
                          debugPrint("Login button pressed");
                        },
                      ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
                    child: 
                      Text(
                        'Don\'t have an account?',
                        style: kBodyStyle,
                        textAlign: TextAlign.center,
                      ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0, right: 15.0),
                    child: 
                      Hyperlink('/signUp', 'Sign up.'),
                  ),
                  Row(
                    children: [
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
                    ]
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0, right: 15.0),
                    child: 
                      Hyperlink('/Homepage', 'Continue as Guest.'),
                  ),
                ]
              ),
            ]
          ),
          ),
      );
  }
}
