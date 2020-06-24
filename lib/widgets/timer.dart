import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sudokoo/utilities/constants.dart';
import 'package:sudokoo/utilities/game_brain.dart';

Board bo = Board();

class TopBar extends StatefulWidget {
  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  void run() {
    Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        bo.time =
            '${bo.swatch.elapsed.inMinutes.toString().padLeft(2, '0')}:${(bo.swatch.elapsed.inSeconds % 60).toString().padLeft(2, '0')}';
      });
    });
  }

  @override
  void initState() {
    super.initState();
    bo.swatch.start();
    run();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // left arrow icon
          GestureDetector(
            onTap: () {
              bo.swatch.stop();
              Navigator.pop(context);
            },
            child: Image.asset(
              'images/game_page/backArrow.png',
              width: MediaQuery.of(context).size.width / 11,
            ),
          ),

          // timer
          Text(
            bo.time,
            style: kTimerTextStyle,
          ),

          // pause icon
          GestureDetector(
            onTap: () {
              setState(() {
                if (bo.swatch.isRunning) {
                  bo.swatch.stop();
                } else {
                  bo.swatch.start();
                  run();
                }
              });
            },
            child: Image.asset(
              'images/game_page/pauseButton.png',
              width: MediaQuery.of(context).size.width / 17,
            ),
          ),
        ],
      ),
    );
  }
}
