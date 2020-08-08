//Data-only class representing the data associated with any kind of query
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Query {
  QueryType queryType;
  String queryText;
  Category queryCategory;
  Position userPosition;

  Query(
      {@required this.queryType,
      this.queryText,
      this.userPosition,
      this.queryCategory});
}

enum Category { Food, Cafes, Pizza, Bars, Top }
enum QueryType { Text, Category, Geospatial }
