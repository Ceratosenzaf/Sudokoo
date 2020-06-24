import 'package:flutter/material.dart';
import 'package:sudokoo/utilities/game_brain.dart';

Board bo = Board();

class NumberBottom extends StatefulWidget {
  @override
  _NumberBottomState createState() => _NumberBottomState();
}

class _NumberBottomState extends State<NumberBottom> {
  List<Widget> getChildren(int from, int to) {
    List<Widget> children = [];
    for (int i = from; i <= to; i++) {
      children.add(
        GestureDetector(
          onTap: () {
            setState(() {
              if (bo.numSelected != i)
                bo.numSelected = i;
              else
                bo.numSelected = 0;
            });
          },
          child: Container(
            width: MediaQuery.of(context).size.width / 10,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  bo.numSelected == i
                      ? 'images/game_page/numbersBottom/selected$i.png'
                      : 'images/game_page/numbersBottom/${bo.theme.toLowerCase()}.png',
                ),
              ),
            ),
            child: Image.asset(
              'images/game_page/numbersBottom/$i.png',
            ),
          ),
        ),
      );
      if (i != to) {
        children.add(SizedBox(
          width: MediaQuery.of(context).size.width / 20,
        ));
      }
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: getChildren(1, 4),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 100,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: getChildren(5, 9),
        ),
      ],
    );
  }
}
