import 'package:dailyaww/features/settings/settings_footer.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Wasssup")),
      bottomNavigationBar: SettingsFooter(),
    );
  }
}
