import 'package:dailyaww/common/theme.dart';
import 'package:dailyaww/features/detail/detail_widget.dart';
import 'package:dailyaww/features/home/home.dart';
import 'package:dailyaww/features/settings/settings.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // uses material app style, and passes in the default widget
    return MaterialApp(
      title: "The Daily Aww",
      theme: appTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeWidget(),
        '/detail': (context) => DetailWidget(),
      },
    );
  }
}
