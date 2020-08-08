import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

enum SortType {
  Distance,
  Rating,
  Sort,
}

class SortDropDown extends StatefulWidget {
  final SortType type;

  //Associates each type with what should be displayed on the button
  static Map<SortType, String> typeDisplayMap = {
    SortType.Distance: "Distance",
    SortType.Rating: "Rating",
    SortType.Sort: "Sort By"
  };

  SortDropDown({@required this.type});

  @override
  _SortDropDownState createState() => _SortDropDownState();
}

class _SortDropDownState extends State<SortDropDown> {
  void showAction() {
    if (widget.type == SortType.Distance) {
      showDistSlider();
    }
    //Handle rating sorting
    else if (widget.type == SortType.Rating) {
      showStarPicker();
    }
    //Handle sort by... sorting
    else if (widget.type == SortType.Sort) {
      showSortPicker();
    }
  }

  void showStarPicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          color: Color.fromARGB(0, 0, 0, 0),
          height: 200,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: CupertinoPicker(
                children: [
                  Text('No Preference'),
                  Text('5+ Stars'),
                  Text('4+ Stars'),
                  Text('3+ Stars'),
                  Text('2+ Stars'),
                  Text('1+ Stars'),
                ],
                itemExtent: 35,
                onSelectedItemChanged: (int select) {
                  //TODO Implement Sort Functionality
                  debugPrint(select.toString());
                },
              ),
            ),
          ),
        );
      },
    );
  }

  void showSortPicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          color: Color.fromARGB(0, 0, 0, 0),
          height: 200,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: CupertinoPicker(
                children: [
                  Text('No Preference'),
                  Text('Rating'),
                  Text('Distance'),
                ],
                itemExtent: 35,
                onSelectedItemChanged: (int select) {
                  //TODO Implement Sort Functionality
                  debugPrint(select.toString());
                },
              ),
            ),
          ),
        );
      },
    );
  }

  //TODO Slider doesn't change position--need to fix
  void showDistSlider() {
    double maxDistance = 50;
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          color: Color.fromARGB(0, 0, 0, 0),
          height: (MediaQuery.of(context).copyWith().size.height / 3),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Text(
                    'Maximum Distance',
                    style: kHeaderStyle,
                  ),
                  Slider(
                    min: 0,
                    max: 100,
                    divisions: 5,
                    onChanged: (double value) {
                      setState(() {
                        maxDistance = value;
                      });
                    },
                    value: maxDistance,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: RaisedButton(
        child: Text(
          SortDropDown.typeDisplayMap[widget.type],
          style: kBodyStyleDark,
        ),
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        /* NEED TO ADD FUNCTIONALITY */
        onPressed: () {
          showAction();
        },
      ),
    );
  }
}
