import 'package:sudokoo/utilities/board_class.dart';

Tab tab = Tab();

class Board {
  String theme = 'Light';

  Stopwatch swatch = Stopwatch();
  String time = '00:00';

  int difficulty = 1;

  int numSelected = 0;
  int boxSelectedX = 8;
  int boxSelectedY = 9;
  String toolSelected = '';

  int getNumber(int x, int y) {
    return (tab.getCurrentBoard(difficulty)[x][y]);
  }

  int getGivenNumber(int x, int y) {
    return (tab.getBoard(difficulty)[x][y]);
  }

  int getSolutionNumber(int x, int y) {
    return (tab.getSolution(difficulty)[x][y]);
  }

  bool isBoxSelected(int x, int y) {
    if (boxSelectedX == x && boxSelectedY == y) return true;
    return false;
  }

  dynamic getBoard() {
    return (tab.getBoard(difficulty));
  }

  void removePress() {
    boxSelectedX = 8;
    boxSelectedY = 9;
  }

  // parts pressed
  void boxPressed(int x, int y) {
    boxSelectedX = x;
    boxSelectedY = y;
    if (toolSelected == '')
      tab.setNumber(difficulty, boxSelectedX, boxSelectedY, numSelected);
    else
      toolPressed(toolSelected);
    if (tab.getBoard(difficulty)[x][y] != 0) numSelected = 0;
    if (numSelected != 0) removePress();
  }

  void numberPressed(int num) {
    numSelected = num;
    if (toolSelected == '')
      tab.setNumber(difficulty, boxSelectedX, boxSelectedY, num);
    else
      toolPressed(toolSelected);
  }

  void toolPressed(String tool) {
    toolSelected = tool;
    if (tool == 'erase') {
      tab.erase(difficulty, boxSelectedX, boxSelectedY);
      boxSelectedX = 8;
      boxSelectedY = 9;
    }
  }

  bool checkWin() {
    for (int x = 0; x < 9; x++) {
      for (int y = 0; y < 9; y++) {
        if (tab.getCurrentBoard(difficulty)[x][y] == 0 ||
            tab.getCurrentBoard(difficulty)[x][y] !=
                tab.getSolution(difficulty)[x][y]) return false;
      }
    }
    return true;
  }

  String getBG(int x, int y) {
    if (toolSelected == 'verify') {
      if (tab.getCurrentBoard(difficulty)[x][y] !=
              tab.getSolution(difficulty)[x][y] &&
          tab.getCurrentBoard(difficulty)[x][y] != 0)
        return 'images/game_page/numbers/wrong.png';
    }
    if (getNumber(x, y) == getNumber(boxSelectedX, boxSelectedY) &&
        getNumber(x, y) != 0)
      return ('images/game_page/numbersSelected/$x$y.png');
    if (getNumber(x, y) == numSelected && numSelected != 0)
      return ('images/game_page/numbersSelected/$x$y.png');
    if (getGivenNumber(x, y) == 0) return '';
    if (getNumber(x, y) != 0)
      return ('images/game_page/numbers/${theme.toLowerCase()}.png');
    return '';
  }

  String getNumImg(int x, int y) {
    if (toolSelected == 'verify') {
      if (tab.getCurrentBoard(difficulty)[x][y] !=
              tab.getSolution(difficulty)[x][y] &&
          tab.getCurrentBoard(difficulty)[x][y] != 0)
        return 'images/game_page/numbers/${getNumber(x, y)}Dark.png';
    }
    if (getNumber(x, y) == getNumber(boxSelectedX, boxSelectedY))
      return 'images/game_page/numbers/${getNumber(x, y)}Dark.png';
    if (getNumber(x, y) == numSelected && numSelected != 0)
      return 'images/game_page/numbers/${getNumber(x, y)}Dark.png';
    if (getGivenNumber(x, y) != 0)
      return 'images/game_page/numbers/${getNumber(x, y)}Dark.png';

    return 'images/game_page/numbers/${getNumber(x, y)}$theme.png';
  }
}
