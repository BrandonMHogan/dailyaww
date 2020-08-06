import 'package:flutter/material.dart';

final appTheme = ThemeData(
  primarySwatch: Colors.deepPurple,
  backgroundColor: Colors.black26,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: TextTheme(
    headline1: TextStyle(
      fontFamily: 'Corben',
      fontWeight: FontWeight.w700,
      fontSize: 24,
      color: Colors.black,
    ),
  ),
);

/// The globally used scaffold for the app
appScaffold(Widget body,
    {String title = "Daily Aww", List<Widget> actions, Widget actionButton}) {
  return Scaffold(
      backgroundColor: Colors.white,
      appBar: setAppBar(title: title, actions: actions),
      body: body,
      floatingActionButton: actionButton);
}

/// The globally used action bar
setAppBar({String title = "Daily Aww", List<Widget> actions}) {
  return AppBar(
    title: Text(title),
    actions: actions,
  );
}
