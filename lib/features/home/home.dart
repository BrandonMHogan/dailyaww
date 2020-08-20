import 'package:dailyaww/common/theme.dart';
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
  void onBottomBarTap(int index) {
    var contentState = Provider.of<ContentState>(context, listen: false);
    switch (index) {
      case 1:
        // saved
        //viewModel.showSaved();
        contentState.showSaved();
        break;
      case 2:
        // settings
        break;
      case 3:
        // refresh
        contentState.refresh();
        break;
      default:
        //viewModel.showNew();
        contentState.showFresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    var contentState = Provider.of<ContentState>(context);

    switch (contentState.displayState) {
      case DisplayState.saved:
        return appScaffold(SaveList(),
            hideAppBar: true,
            bottomNavigationBar:
                getHomeFooter(onBottomBarTap, currentIndex: 1));
        break;
      default:
        return appScaffold(FreshList(),
            hideAppBar: true,
            bottomNavigationBar:
                getHomeFooter(onBottomBarTap, currentIndex: 0));
    }
  }
}
