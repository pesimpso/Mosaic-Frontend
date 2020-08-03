import 'package:flutter/material.dart';
import 'package:mosaicapp/widgets/nav_bar.dart';

class Homepage extends StatefulWidget {
  static const String id = '/homepage';

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: <Widget>[
            NavBar(),
          ],
        ),
      ),
    );
  }
}
