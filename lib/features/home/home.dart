import 'package:dailyaww/common/theme.dart';
import 'package:dailyaww/features/home/home_footer.dart';
import 'package:dailyaww/features/home/home_viewmodel.dart';
import 'package:dailyaww/features/list/content_list.dart';
import 'package:dailyaww/features/list/content_list_viewmodel.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  HomeViewModel viewModel;
  FirebaseAnalytics analytics = FirebaseAnalytics();

  @override
  void initState() {
    super.initState();
    viewModel = HomeViewModel(ContentListViewModel());
  }

  void onBottomBarTap(int index) {
    switch (index) {
      case 1:
        // saved
        viewModel.showSaved();
        break;
      case 2:
        // settings
        break;
      case 3:
        // refresh
        viewModel.refresh();
        break;
      default:
        viewModel.showNew();
    }
  }

  @override
  Widget build(BuildContext context) {
    return appScaffold(
        ChangeNotifierProvider(
            create: (context) => viewModel.contentViewModel,
            child: ContentListWidget()),
        hideAppBar: true,
        bottomNavigationBar: getHomeFooter(onBottomBarTap));
  }
}
