import 'package:dailyaww/common/theme.dart';
import 'package:dailyaww/features/home/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'common/routes.dart';
import 'shared/content_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseAnalytics analytics = FirebaseAnalytics();
  final ContentState contentState = ContentState();

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
          return MultiProvider(
            providers: [
              ChangeNotifierProvider.value(value: contentState),
              ChangeNotifierProvider.value(value: contentState.saved),
              ChangeNotifierProvider.value(value: contentState.fresh),
            ],
            child: MaterialApp(
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
              home: HomeWidget(),
            ),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return new Directionality(
            textDirection: TextDirection.ltr, child: new Text('Loading'));
      },
    );
  }
}
