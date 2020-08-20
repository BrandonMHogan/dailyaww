import 'package:dailyaww/common/list.dart';
import 'package:dailyaww/shared/fresh_list_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FreshList extends StatefulWidget {
  @override
  _FreshListState createState() => _FreshListState();
}

class _FreshListState extends State<FreshList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FreshListContent>(
      builder: (context, freshListContent, child) {
        return list(context, ScrollController(), freshListContent.content);
      },
    );
  }
}
