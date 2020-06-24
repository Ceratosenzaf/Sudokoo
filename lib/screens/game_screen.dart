import 'package:flutter/material.dart';
import 'package:sudokoo/utilities/constants.dart';
import 'package:sudokoo/utilities/game_brain.dart';
import 'package:sudokoo/widgets/bottom_nums.dart';
import 'package:sudokoo/widgets/prova.dart';
import 'package:sudokoo/widgets/table.dart';
import 'package:sudokoo/widgets/timer.dart';
import 'package:sudokoo/widgets/tools.dart';

Board bo = Board();

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: bo.theme == 'Light' ? Colors.white : Colors.black54,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // top row
            TopBar(),

            // game part of page
            Game(),
          ],
        ),
      ),
    );
  }
}
