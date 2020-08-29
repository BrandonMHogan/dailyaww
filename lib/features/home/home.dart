import 'package:dailyaww/features/content_lists/fresh_list.dart';
import 'package:dailyaww/features/content_lists/saved_list.dart';
import 'package:dailyaww/features/home/home_footer.dart';
import 'package:dailyaww/shared/content_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    var contentState = Provider.of<ContentState>(context);

    return Scaffold(
      body: contentState.displayState == DisplayState.saved
          ? SaveList()
          : FreshList(),
      bottomNavigationBar: HomeFooter(
        currentIndex: contentState.displayState == DisplayState.saved ? 1 : 0,
      ),
    );
  }
}
