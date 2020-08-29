import 'package:dailyaww/common/styles/theme_model.dart';
import 'package:dailyaww/features/settings/settings_footer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  void _buttonClicked() {
    Provider.of<ThemeModel>(context, listen: false).toggleTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ElevatedButton(
            child: Text("Click Me"),
            onPressed: _buttonClicked,
          ),
        ),
      ),
      bottomNavigationBar: SettingsFooter(),
    );
  }
}
