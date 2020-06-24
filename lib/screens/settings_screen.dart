import 'package:flutter/material.dart';
import 'package:sudokoo/utilities/constants.dart';
import 'package:sudokoo/utilities/game_brain.dart';

Board bo = Board();

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => new _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bo.theme == 'Light' ? Colors.white : Colors.black54,
      appBar: AppBar(
        title: Text('SETTINGS'),
      ),
      body: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                bo.theme = bo.theme == 'Light' ? 'Dark' : 'Light';
              });
            },
            child: Text(
              '${bo.theme} theme',
              style: TextStyle(
                color: bo.theme == 'Light' ? Colors.black : Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
