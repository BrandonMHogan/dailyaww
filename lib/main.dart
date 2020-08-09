import 'package:dailyaww/common/theme.dart';
import 'package:dailyaww/features/detail/detail_widget.dart';
import 'package:dailyaww/features/home/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';

import 'common/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  FirebaseAnalytics analytics = FirebaseAnalytics();
  // final String name = 'Daily Aww';
  // final FirebaseOptions options = const FirebaseOptions(
  //   googleAppID: '1:315673900552:android:a508a1dda8e445790a03bd',
  //   gcmSenderID: '315673900552',
  //   apiKey: 'AIzaSyAO-qSUBYKqlM_a8sZLA6n2XR4vPZSOcYY',
  // );

  Widget app() {
    return MaterialApp(
      title: "The Daily Aww",
      theme: appTheme.theme,
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

  Widget loading() {
    return Dialog(
      child: new Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          new CircularProgressIndicator(),
          new Text("Loading"),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return app();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return app();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return loading();
      },
    );
  }
}
