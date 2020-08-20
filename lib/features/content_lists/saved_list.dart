import 'package:dailyaww/common/list.dart';
import 'package:dailyaww/shared/saved_list_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SaveList extends StatefulWidget {
  @override
  _SaveListState createState() => _SaveListState();
}

class _SaveListState extends State<SaveList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SavedListContent>(
      builder: (context, savedListContent, child) {
        return list(context, ScrollController(), savedListContent.content);
      },
    );
  }
}
