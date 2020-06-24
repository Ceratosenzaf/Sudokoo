import 'package:flutter/material.dart';
import 'package:sudokoo/utilities/game_brain.dart';

Board bo = Board();

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  String difficulty = 'easy';
  var tools = ['back', 'erase', 'notes', 'verify'];

  // table
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
    int number = bo.getNumber(x, y);

    String background = bo.getBG(x, y);

    String selectedbg =
        bo.isBoxSelected(x, y) ? 'images/game_page/selected.png' : '';

    String numberImg = bo.getNumImg(x, y);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (bo.isBoxSelected(x, y)) {
            bo.removePress();
            bo.numSelected = 0;
          } else
            bo.boxPressed(x, y);
          if (bo.checkWin()) Navigator.pushNamed(context, '/win');
        });
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(selectedbg),
          ),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width / 12,
          height: MediaQuery.of(context).size.width / 12,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(background),
            ),
          ),
          child: Image.asset(
            numberImg,
          ),
        ),
      ),
    );
  }

  // tools
  List<Widget> getChildren() {
    List<Widget> children = [];
    for (int i = 0; i < 4; i++) {
      children.add(
        GestureDetector(
          onTap: () {
            setState(() {
              if (bo.toolSelected != tools[i])
                bo.toolPressed(tools[i]);
              else
                bo.toolSelected = '';
              if (bo.checkWin()) Navigator.pushNamed(context, '/win');
            });
          },
          child: Image.asset(
            bo.toolSelected == tools[i]
                ? 'images/game_page/tools/${tools[i]}Selected.png'
                : 'images/game_page/tools/${tools[i]}${bo.theme}.png',
            width: MediaQuery.of(context).size.width / 15,
          ),
        ),
      );
      if (i != 3) {
        children.add(SizedBox(
          width: MediaQuery.of(context).size.width / 20,
        ));
      }
    }
    return children;
  }

  // numbers bottom
  List<Widget> getChildrenBottom(int from, int to) {
    List<Widget> children = [];
    for (int i = from; i <= to; i++) {
      children.add(
        GestureDetector(
          onTap: () {
            setState(() {
              if (bo.numSelected != i)
                bo.numberPressed(i);
              else {
                bo.numSelected = 0;
                bo.removePress();
              }
              if (bo.checkWin()) Navigator.pushNamed(context, '/win');
            });
          },
          child: Container(
            width: MediaQuery.of(context).size.width / 10,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  bo.numSelected == i
                      ? 'images/game_page/numbers/selected$i.png'
                      : 'images/game_page/numbers/${bo.theme.toLowerCase()}.png',
                ),
              ),
            ),
            child: Image.asset(
              'images/game_page/numbers/${i}Dark.png',
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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        // table
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/game_page/table.png'),
            ),
          ),
          child: Column(children: getColumnChildren()),
        ),

        SizedBox(
          height: MediaQuery.of(context).size.width / 30,
        ),

        // tools row
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: getChildren(),
        ),

        SizedBox(
          height: MediaQuery.of(context).size.width / 20,
        ),

        // numbers
        Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: getChildrenBottom(1, 4),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: getChildrenBottom(5, 9),
            ),
          ],
        ),
      ],
    );
  }
}
