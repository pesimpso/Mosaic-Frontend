import 'package:flutter/material.dart';
import 'package:mosaicapp/screens/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Homepage.id,
      routes: {
        Homepage.id: (context) => Homepage(),
      },
    );
  }
}
