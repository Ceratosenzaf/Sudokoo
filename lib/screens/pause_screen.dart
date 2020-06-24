import 'package:flutter/material.dart';
import 'package:sudokoo/utilities/game_brain.dart';

Board bo = Board();

class Pause extends StatefulWidget {
  @override
  _PauseState createState() => _PauseState();
}

class _PauseState extends State<Pause> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GAME PAUSED'),
      ),
      body: FlatButton(
        onPressed: () {
          setState(() {
            bo.swatch.start();
          });
          Navigator.pop(context);
        },
        child: Text(
          'Go Back Playing',
        ),
      ),
    );
  }
}
