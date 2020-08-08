import 'package:dailyaww/common/theme.dart';
import 'package:dailyaww/features/detail/detail_widget.dart';
import 'package:dailyaww/features/home/home.dart';
import 'package:flutter/material.dart';

import 'common/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // uses material app style, and passes in the default widget
    return MaterialApp(
      title: "The Daily Aww",
      theme: appTheme.theme,
      initialRoute: Routes.Home,
      routes: {
        Routes.Home: (context) => HomeWidget(),
        Routes.Detail: (context) => DetailWidget(),
      },
    );
  }
}
