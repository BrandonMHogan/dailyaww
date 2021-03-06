import 'package:dailyaww/common/styles/theme.dart';
import 'package:dailyaww/common/styles/theme_model.dart';
import 'package:dailyaww/services/localizations_service.dart';
import 'package:dailyaww/shared/content_item.dart';
import 'package:dailyaww/shared/content_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsFooter extends StatefulWidget {
  const SettingsFooter();

  static const save = BottomNavigationBarItem(
      icon: Icon(Icons.favorite), title: Text(Localize.save));

  static const back = BottomNavigationBarItem(
      icon: Icon(Icons.arrow_back), title: Text(Localize.back));

  @override
  _SettingsFooterState createState() => _SettingsFooterState();
}

class _SettingsFooterState extends State<SettingsFooter> {
  ContentState contentState;
  ContentModel contentModel;

  /// Handles bottom bar taps. Index used to determine which
  /// button was pressed
  void onBottomBarTap(int index) async {
    if (index == 0) {
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeModel>(context, listen: false);

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: theme.currentTheme.primaryColor,
      unselectedItemColor: theme.currentTheme.accentColor,
      backgroundColor: theme.currentTheme.backgroundColor,
      items: <BottomNavigationBarItem>[
        SettingsFooter.save,
        SettingsFooter.back,
      ],
      onTap: onBottomBarTap,
      currentIndex: 1,
    );
  }
}
