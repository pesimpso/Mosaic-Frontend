import 'package:flutter/material.dart';
import 'package:mosaicapp/screens/businesspage.dart';
import 'package:mosaicapp/screens/login.dart';
import 'package:mosaicapp/screens/homepage.dart';
import 'package:mosaicapp/screens/sign_up.dart';
import 'package:mosaicapp/screens/settings.dart';
import 'package:mosaicapp/screens/accountpage.dart';
import 'package:mosaicapp/screens/results.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Settings.id,
      //Route String : Function pair
      routes: {
        Login.id: (context) => Login(),
        Homepage.id: (context) => Homepage(),
        SignUp.id: (context) => SignUp(),
        Settings.id: (context) => Settings(),
        AccountPage.id: (context) => AccountPage(),
        Results.id: (context) => Results(),
        BusinessPage.id: (context) => BusinessPage(),
      },
    );
  }
}
