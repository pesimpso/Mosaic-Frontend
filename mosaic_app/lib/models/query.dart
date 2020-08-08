//Data-only class representing the data associated with any kind of query
import 'package:mosaicapp/models/coordinates.dart';
import 'package:flutter/material.dart';

class Query {
  QueryType queryType;
  String queryText;
  Category queryCategory;
  Coordinates coordinates;

  Query(
      {@required this.queryType,
      this.queryText,
      this.coordinates,
      this.queryCategory});
}

enum Category { Food, Cafes, Pizza, Bars, Top }
enum QueryType { Text, Category, Geospatial }
