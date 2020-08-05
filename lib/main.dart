import 'package:dailyaww/features/home.dart';
import 'package:dailyaww/features/settings/settings.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Aww',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.deepPurple,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          // Here we take the value from the HomeWidget object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Daily Aww"),
        ),
        body: HomeWidget(title: "Daily Aww"),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Increment',
          onPressed: () {},
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
