import 'package:flutter/material.dart';
import 'package:sudokoo/screens/daily_screen.dart';
import 'package:sudokoo/screens/pause_screen.dart';
import 'package:sudokoo/screens/settings_screen.dart';
import 'screens/loading_screen.dart';
import 'screens/game_screen.dart';
import 'screens/win_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      initialRoute: '/',
      routes: {
        '/': (context) => LoadingScreen(),
        '/game': (context) => GameScreen(),
        '/daily': (context) => DailyChallengeScreen(),
        '/settings': (context) => Settings(),
        '/win': (context) => Win(),
        '/pause': (context) => Pause(),
      },
    );
  }
}
