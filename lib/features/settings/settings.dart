import 'package:flutter/material.dart';

class SettingsWidget extends StatefulWidget {
  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the HomeWidget object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Tittle"),
      ),
      body: Center(child: Text("Wasssup")),
    );
  }
}
