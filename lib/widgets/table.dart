import 'package:flutter/material.dart';
import 'package:sudokoo/utilities/game_brain.dart';

Board bo = Board();

class SudokuTable extends StatefulWidget {
  @override
  _SudokuTableState createState() => _SudokuTableState();
}

class _SudokuTableState extends State<SudokuTable> {
  String difficulty = 'easy';

  List<Widget> getColumnChildren() {
    List<Widget> children = [];
    for (int x = 0; x < 9; x++) {
      if (x % 3 == 0)
        x == 0
            ? children
                .add(SizedBox(height: MediaQuery.of(context).size.width / 27))
            : children
                .add(SizedBox(height: MediaQuery.of(context).size.width / 22));
      else
        children.add(SizedBox(height: MediaQuery.of(context).size.width / 70));
      children.add(Row(children: getRowChildren(x)));
    }
    return (children);
  }

  List<Widget> getRowChildren(int x) {
    List<Widget> children = [];

    for (int y = 0; y < 9; y++) {
      if (y % 3 == 0)
        y == 0
            ? children
                .add(SizedBox(width: MediaQuery.of(context).size.width / 27))
            : children
                .add(SizedBox(width: MediaQuery.of(context).size.width / 22));
      else
        children.add(SizedBox(
          width: MediaQuery.of(context).size.width / 70,
        ));

      children.add(getBoxContent(x, y));
    }

    return (children);
  }

  Widget getBoxContent(x, y) {
    int number = bo.getNumber( x, y);
    String background = number != 0
        ? 'images/game_page/numbersBottom/${bo.theme.toLowerCase()}.png'
        : '';
    if (number == bo.getNumber( bo.boxSelectedX, bo.boxSelectedY) &&
            number != 0 ||
        number == bo.numSelected && bo.numSelected != 0)
      background = 'images/game_page/numbersSelected/$x$y.png';

    return Container(
      width: MediaQuery.of(context).size.width / 12,
      height: MediaQuery.of(context).size.width / 12,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(background),
        ),
      ),
      child: Image.asset('images/game_page/numbersBottom/$number.png'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/game_page/table.png'),
        ),
      ),
      child: Column(children: getColumnChildren()),
    );
  }
}
