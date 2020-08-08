import 'package:flutter/material.dart';
import 'package:mosaicapp/constants.dart';
import 'package:mosaicapp/models/app_data.dart';
import 'package:mosaicapp/models/query.dart';
import 'package:mosaicapp/models/query_return_data.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: EdgeInsets.all(15.0),
        child: TextField(
          style: kBodyStyleDark,
          enabled: true,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: const OutlineInputBorder(),
            hintText: 'Search for...',
          ),
          onSubmitted: (String queryText) {
            QueryReturnData returnData = Provider.of<AppData>(context)
                .query(Query(queryType: QueryType.Text, queryText: queryText));
          },
          /* NEED TO ADD FUNCTIONALITY */
        ),
      ),
    ]);
  }
}
