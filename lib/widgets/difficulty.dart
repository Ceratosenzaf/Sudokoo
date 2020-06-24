import 'package:flutter/material.dart';
import 'package:sudokoo/utilities/game_brain.dart';
import 'package:swipedetector/swipedetector.dart';

Board bo = Board();

class DifficultyRow extends StatefulWidget {
  @override
  _DifficultyRowState createState() => _DifficultyRowState();
}

class _DifficultyRowState extends State<DifficultyRow> {
  int difficulty = 1;

  String getDifficulty() {
    String dif = '';
    if (difficulty == 0) dif ='Easy';
    else if (difficulty == 1)  dif ='Medium';
    else if (difficulty == 2) dif = 'Hard';
    
    bo.difficulty = difficulty;
    return ('images/loading_screen/difficulty$dif.png');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // left arrow
        GestureDetector(
          onTap: () {
            setState(() {
              if (difficulty == 1 || difficulty == 2) {
                difficulty--;
                print('difficulty $difficulty');
              }
            });
          },
          child: Image.asset(
            'images/loading_screen/difficultyArrowLeft.png',
            width: MediaQuery.of(context).size.width / 15,
          ),
        ),

        // difficulty
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SwipeDetector(
            child: Image.asset(
              getDifficulty(),
              width: MediaQuery.of(context).size.width / 5 * 2,
            ),
            onSwipeLeft: () {
              setState(() {
                if (difficulty == 0 || difficulty == 1) difficulty++;
              });
            },
            onSwipeRight: () {
              setState(() {
                if (difficulty == 2 || difficulty == 1) difficulty--;
              });
            },
            swipeConfiguration: SwipeConfiguration(
              horizontalSwipeMaxHeightThreshold: 50.0,
              horizontalSwipeMinDisplacement: 20.0,
            ),
          ),
        ),

        // right arrow
        GestureDetector(
          onTap: () {
            setState(() {
              if (difficulty == 1 || difficulty == 0) {
                difficulty++;
                print('difficulty $difficulty');
              }
            });
          },
          child: Image.asset(
            'images/loading_screen/difficultyArrowRight.png',
            width: MediaQuery.of(context).size.width / 15,
          ),
        ),
      ],
    );
  }
}
