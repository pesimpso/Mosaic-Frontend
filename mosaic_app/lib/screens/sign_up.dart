import 'package:flutter/material.dart';
import 'package:mosaicapp/constants.dart';

class SignUp extends StatefulWidget {
  static const String id = '/signUp';

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                Padding(
                    padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
                    child: 
                      TextField(
                        enabled: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: const OutlineInputBorder(),
                          hintText: 'Re-enter password',    
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
                            'Sign Up!', 
                            style: kBodyStyle,                      
                          ),
                        color: Colors.lightBlue,
                        clipBehavior: Clip.hardEdge,
                        /* NEED TO ADD FUNCTIONALITY */
                        onPressed: () {
                          //TODO Delete debugPrint and implement functionality
                          debugPrint("SignUp button pressed");
                        },
                      ),
                  ),
              ]
            ),
          ]
        ),
      ),
    );
  }
}
