import 'package:flutter/material.dart';
import 'package:mosaicapp/models/app_data.dart';
import 'package:mosaicapp/models/query.dart';
import 'package:mosaicapp/models/query_return_data.dart';
import 'package:mosaicapp/screens/results.dart';
import 'package:provider/provider.dart';

abstract class CategoryIconAncestor extends StatelessWidget {
  QueryReturnData returnData;
  Future getQuery(BuildContext context, Category category) async {
    returnData = await Provider.of<AppData>(context, listen: false)
        .query(Query(queryType: QueryType.Category, queryCategory: category));
  }

  void queryCategory(BuildContext context, Category category) async {
    await getQuery(context, category);
    if (returnData.success) {
      Navigator.pushNamed(context, Results.id, arguments: returnData.result);
    }
  }
}
