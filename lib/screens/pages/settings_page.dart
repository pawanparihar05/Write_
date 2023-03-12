import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
          child: Text(
        "Settings",
        style: TextStyle(color: Colors.red),
      )),
    );
  }
}
