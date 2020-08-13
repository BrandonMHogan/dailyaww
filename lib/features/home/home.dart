import 'package:dailyaww/features/home/home_list.dart';
import 'package:dailyaww/features/home/home_list_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

/// Provides the home view model which handles the content loading
/// to its child, the HomeList widget.
class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => HomeListViewModel(), child: HomeListWidget());
  }
}
