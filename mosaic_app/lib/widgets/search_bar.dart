import 'package:flutter/material.dart';
import 'package:mosaicapp/constants.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Padding(
          padding: EdgeInsets.all(15.0),
          child: 
            TextField(
              enabled: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: const OutlineInputBorder(),
                hintText: 'Search for...',                       
              ),
              /* NEED TO ADD FUNCTIONALITY */
            ),
          ),
        ]
      );
  }
}
