import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

// ignore: camel_case_types
class appTheme {
  static const primary = Colors.deepPurple;
  static const accent = Colors.white70;
  static const textColor = Colors.white70;
  static const background = const Color(0xCC181818);
  static const widgetBackground = Colors.white12;
  static const fontFamily = 'Corben';

  /// Theme for generic text
  static final textTheme = TextStyle(
    color: textColor,
    fontFamily: fontFamily,
  );

  /// Theme for subtext (includes ListTile)
  static final subTextTheme = TextStyle(
    color: textColor,
    fontFamily: fontFamily,
  );

  /// Theme for headline items
  static final headlineTheme = TextStyle(
    color: textColor,
    fontFamily: fontFamily,
  );

  /// Theme for Cards
  static final cardTheme = CardTheme(
    color: widgetBackground,
    elevation: 3,
  );

  /// Global App Theme
  static var theme = ThemeData(
    primaryColor: primary,
    accentColor: accent,
    backgroundColor: background,
    primarySwatch: primary,
    brightness: Brightness.dark,
    canvasColor: Colors.transparent,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    cardTheme: cardTheme,
    textTheme: TextTheme(
      headline1: headlineTheme,
      bodyText1: textTheme,
      bodyText2: textTheme,
      subtitle1: subTextTheme,
      subtitle2: subTextTheme,
    ),
  );
}

/// global scaffold style
appScaffold(Widget body,
    {hideAppBar = false,
    String title = "Daily Aww",
    List<Widget> actions,
    Widget actionButton,
    BottomNavigationBar bottomNavigationBar,
    Widget footer,
    bool isLoading = false}) {
  return Scaffold(
      backgroundColor: appTheme.background,
      appBar: hideAppBar ? null : setAppBar(title: title, actions: actions),
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: body,
        progressIndicator: getCircularProgressIndicator(),
      ),
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: actionButton);
}

/// global app bar style
setAppBar({String title = "Daily Aww", List<Widget> actions}) {
  return AppBar(
    title: Text(title),
    actions: actions,
  );
}

/// global bottom bar style
setBottomBar(List<BottomNavigationBarItem> items, ontap, {currentIndex = 0}) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: appTheme.primary,
    unselectedItemColor: appTheme.accent,
    backgroundColor: appTheme.widgetBackground,
    items: items,
    onTap: ontap,
    currentIndex: currentIndex,
  );
}

/// styled, centered circular progress indicator
getCenteredCircularProgressIndicator(
  downloadProgress, {
  size = 48.0,
}) {
  return Center(
    child: Container(
      margin: const EdgeInsets.all(10.0),
      width: size,
      height: size,
      child: getCircularProgressIndicator(downloadProgress: downloadProgress),
    ),
  );
}

/// styled circular progress indicator
getCircularProgressIndicator({downloadProgress}) {
  return CircularProgressIndicator(
      value: downloadProgress?.progress,
      valueColor: new AlwaysStoppedAnimation<Color>(appTheme.primary),
      backgroundColor: Colors.transparent);
}

///globally designed error dialog
setErrorDialog() {
  return Icon(Icons.error);
}
