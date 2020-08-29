import 'package:dailyaww/common/routes/routes.dart';
import 'package:dailyaww/common/styles/theme_model.dart';
import 'package:dailyaww/services/localizations_service.dart';
import 'package:dailyaww/shared/content_item.dart';
import 'package:dailyaww/shared/content_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeFooter extends StatefulWidget {
  final currentIndex;

  HomeFooter({this.currentIndex = 0});

  static const home = BottomNavigationBarItem(
      icon: Icon(Icons.home), title: Text(Localize.home));

  static const refresh = BottomNavigationBarItem(
      icon: Icon(Icons.refresh), title: Text(Localize.refresh));

  static const settings = BottomNavigationBarItem(
      icon: Icon(Icons.settings), title: Text(Localize.settings));

  static const saved = BottomNavigationBarItem(
      icon: Icon(Icons.favorite), title: Text(Localize.saved));

  @override
  _HomeFooterState createState() => _HomeFooterState();
}

class _HomeFooterState extends State<HomeFooter> {
  ContentState contentState;
  ContentModel contentModel;

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
        Routes.toSettings(context);
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
    var theme = Provider.of<ThemeModel>(context, listen: false);

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        HomeFooter.home,
        HomeFooter.saved,
        HomeFooter.settings,
        HomeFooter.refresh
      ],
      onTap: onBottomBarTap,
      currentIndex: widget.currentIndex,
    );
  }
}
