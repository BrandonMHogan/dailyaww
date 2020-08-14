import 'package:dailyaww/common/theme.dart';
import 'package:dailyaww/features/detail/detail.dart';
import 'package:dailyaww/features/home/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'common/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  FirebaseAnalytics analytics = FirebaseAnalytics();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          //return app();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: "The Daily Aww",
            theme: appTheme.theme,
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              const Locale('en', ''), // English, no country code
              const Locale('fr', ''), // French, no country code
            ],
            initialRoute: Routes.Home,
            navigatorObservers: [
              FirebaseAnalyticsObserver(analytics: analytics),
            ],
            routes: {
              Routes.Home: (context) => HomeWidget(),
              Routes.Detail: (context) => DetailWidget(),
            },
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        // return new Directionality(
        //     textDirection: TextDirection.ltr, child: new Text('Loading'));
      },
    );
  }
}
