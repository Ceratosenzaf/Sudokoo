import 'package:flutter/material.dart';

class Win extends StatefulWidget {
  @override
  _WinState createState() => _WinState();
}

class _WinState extends State<Win> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'YOU WON',
          ),
          FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            child: Text(
              'back to main screen',
            ),
          )
        ],
      ),
    );
  }
}
