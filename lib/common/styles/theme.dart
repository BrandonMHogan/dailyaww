import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: appTheme.darkPrimary,
    accentColor: appTheme.darkAccent,
    backgroundColor: appTheme.darkBackground,
    brightness: Brightness.dark,
    canvasColor: Colors.transparent,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    cardTheme: appTheme.darkCardTheme,
    textTheme: TextTheme(
      headline1: appTheme.darkHeadlineTheme,
      bodyText1: appTheme.darkTextTheme,
      bodyText2: appTheme.darkTextTheme,
      subtitle1: appTheme.darkSubTextTheme,
      subtitle2: appTheme.darkSubTextTheme,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.grey[900],
      elevation: 10,
      selectedLabelStyle: TextStyle(
          color: Color(0xFFA67926), fontFamily: 'Montserrat', fontSize: 14.0),
      unselectedLabelStyle: TextStyle(
          color: Colors.grey[600], fontFamily: 'Montserrat', fontSize: 12.0),
      selectedItemColor: Color(0xFFA67926),
      unselectedItemColor: Colors.grey[600],
      showUnselectedLabels: true,
    ));

ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: appTheme.lightPrimary,
    accentColor: appTheme.lightAccent,
    backgroundColor: appTheme.lightBackground,
    brightness: Brightness.light,
    canvasColor: Colors.transparent,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    cardTheme: appTheme.lightCardTheme,
    textTheme: TextTheme(
      headline1: appTheme.lightHeadlineTheme,
      bodyText1: appTheme.lightTextTheme,
      bodyText2: appTheme.lightTextTheme,
      subtitle1: appTheme.lightSubTextTheme,
      subtitle2: appTheme.lightSubTextTheme,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.grey[900],
      elevation: 10,
      selectedLabelStyle: TextStyle(
          color: Color(0xFFA67926), fontFamily: 'Montserrat', fontSize: 14.0),
      unselectedLabelStyle: TextStyle(
          color: Colors.grey[600], fontFamily: 'Montserrat', fontSize: 12.0),
      selectedItemColor: Color(0xFFA67926),
      unselectedItemColor: Colors.grey[600],
      showUnselectedLabels: true,
    ));

// ignore: camel_case_types
class appTheme {
  static const darkPrimary = Colors.deepPurple;
  static const darkAccent = Colors.white70;
  static const darkTextColor = Colors.white70;
  static const darkBackground = const Color(0xCC181818);
  static const darkWidgetBackground = Colors.white12;

  static const lightPrimary = Colors.purple;
  static const lightAccent = Colors.blue;
  static const lightTextColor = Colors.black;
  static const lightBackground = Colors.white;
  static const lightWidgetBackground = Colors.white30;

  static const fontFamily = 'Corben';

  /// Theme for generic text
  static final darkTextTheme = TextStyle(
    color: darkTextColor,
    fontFamily: fontFamily,
  );

  static final lightTextTheme = TextStyle(
    color: lightTextColor,
    fontFamily: fontFamily,
  );

  /// Theme for subtext (includes ListTile)
  static final darkSubTextTheme = TextStyle(
    color: darkTextColor,
    fontFamily: fontFamily,
  );

  static final lightSubTextTheme = TextStyle(
    color: lightTextColor,
    fontFamily: fontFamily,
  );

  /// Theme for headline items
  static final darkHeadlineTheme = TextStyle(
    color: darkTextColor,
    fontFamily: fontFamily,
  );

  static final lightHeadlineTheme = TextStyle(
    color: lightTextColor,
    fontFamily: fontFamily,
  );

  /// Theme for Cards
  static final darkCardTheme = CardTheme(
    color: darkWidgetBackground,
    elevation: 3,
  );

  static final lightCardTheme = CardTheme(
    color: lightWidgetBackground,
    elevation: 3,
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
      valueColor: new AlwaysStoppedAnimation<Color>(appTheme.darkPrimary),
      backgroundColor: Colors.transparent);
}

///globally designed error dialog
setErrorDialog() {
  return Icon(Icons.error);
}
