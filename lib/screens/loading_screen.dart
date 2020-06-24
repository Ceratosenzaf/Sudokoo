import 'package:flutter/material.dart';
import 'package:sudokoo/utilities/constants.dart';
import 'package:sudokoo/widgets/difficulty.dart';
import 'package:sudokoo/utilities/game_brain.dart';

Board bo = Board();

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: bo.theme == 'Light' ? Colors.white : Colors.black54,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),

            // logo top
            Image.asset(
              'images/loading_screen/logo.png',
              width: MediaQuery.of(context).size.width / 5 * 2,
            ),

            // mid page buttons
            Column(
              children: <Widget>[
                // difficulty bar
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DifficultyRow(),
                ),

                // new game button
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/game');
                    },
                    child: Image.asset(
                      'images/loading_screen/buttonNewGame.png',
                      width: MediaQuery.of(context).size.width / 5 * 2,
                    ),
                  ),
                ),

                // resume button
                bo.getBoard() == null
                    ? SizedBox(
                        width: MediaQuery.of(context).size.width / 5 * 2,
                      )
                    : GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/game');
                        },
                        child: Image.asset(
                          'images/loading_screen/buttonResume.png',
                          width: MediaQuery.of(context).size.width / 5 * 2,
                        ),
                      )
              ],
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height / 10,
            ),

            // bottom bar
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // daily challenges button
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/daily');
                    },
                    child: Image.asset(
                      'images/loading_screen/bottomDailyChallenges.png',
                      width: MediaQuery.of(context).size.width / 5 * 4 - 5,
                    ),
                  ),

                  // settings button
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/settings');
                    },
                    child: Image.asset(
                      'images/loading_screen/bottomSettingsIcon.png',
                      width: MediaQuery.of(context).size.width / 5 - 5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
