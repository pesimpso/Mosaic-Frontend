import 'package:flutter/material.dart';
import 'package:mosaicapp/models/app_data.dart';
import 'package:mosaicapp/models/query.dart';
import 'package:mosaicapp/models/query_return_data.dart';
import 'package:mosaicapp/screens/results.dart';
import 'package:provider/provider.dart';

abstract class CategoryIconAncestor extends StatelessWidget {
  void queryCategory(BuildContext context, Category category) {
    QueryReturnData returnData = Provider.of<AppData>(context, listen: false)
        .query(Query(queryType: QueryType.Category, queryCategory: category));
    if (returnData.success) {
      Navigator.pushNamed(context, Results.id, arguments: returnData.result);
    }
  }
}
