//Data-only class used to return whether a query was successfull, and the associated data if so
import 'package:mosaicapp/models/restaurant.dart';

class QueryReturnData {
  bool success;
  List<Restaurant> result;
}
