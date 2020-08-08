import 'package:flutter/material.dart';
import 'package:mosaicapp/screens/businesspage.dart';
import 'package:mosaicapp/screens/login.dart';
import 'package:mosaicapp/screens/homepage.dart';
import 'package:mosaicapp/screens/sign_up.dart';
import 'package:mosaicapp/screens/settings.dart';
import 'package:mosaicapp/screens/accountpage.dart';
import 'package:mosaicapp/screens/results.dart';
import 'package:provider/provider.dart';

import 'models/app_data.dart';
import 'models/restaurant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppData(),
      child: MaterialApp(
        initialRoute: Login.id,
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
      ),
    );
  }
}
