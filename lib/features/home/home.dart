import 'package:dailyaww/features/home/home_viewmodel.dart';
import 'package:dailyaww/widget/content_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => HomeViewModel(),
        child: Consumer<HomeViewModel>(builder: (context, viewmodel, child) {
          return ContentList();
        }));
  }
}
