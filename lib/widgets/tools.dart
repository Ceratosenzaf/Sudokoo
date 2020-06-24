import 'package:flutter/material.dart';
import 'package:sudokoo/utilities/game_brain.dart';

Board bo = Board();

class Tools extends StatefulWidget {
  @override
  _ToolsState createState() => _ToolsState();
}

class _ToolsState extends State<Tools> {
  var tools = ['back', 'erase', 'notes', 'verify'];

  List<Widget> getChildren() {
    List<Widget> children = [];
    for (int i = 0; i < 4; i++) {
      children.add(
        GestureDetector(
          onTap: () {
            setState(() {
              if (bo.toolSelected != tools[i])
                bo.toolSelected = tools[i];
              else
                bo.toolSelected = '';
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

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: getChildren(),
    );
  }
}
