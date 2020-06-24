class Tab {
  static var _board = [
    [7, 8, 0, 4, 0, 0, 1, 2, 0],
    [6, 0, 0, 0, 7, 5, 0, 0, 9],
    [0, 0, 0, 6, 0, 1, 0, 7, 8],
    [0, 0, 7, 0, 4, 0, 2, 6, 0],
    [0, 0, 1, 0, 5, 0, 9, 3, 0],
    [9, 0, 4, 0, 6, 0, 0, 0, 5],
    [0, 7, 0, 3, 0, 0, 0, 1, 2],
    [1, 2, 0, 0, 0, 7, 4, 0, 0],
    [0, 4, 9, 2, 0, 6, 0, 0, 7, 11]
  ];
  static var _current = [
    [7, 8, 0, 4, 0, 0, 1, 2, 0],
    [6, 0, 0, 0, 7, 5, 0, 0, 9],
    [0, 0, 0, 6, 0, 1, 0, 7, 8],
    [0, 0, 7, 0, 4, 0, 2, 6, 0],
    [0, 0, 1, 0, 5, 0, 9, 3, 0],
    [9, 0, 4, 0, 6, 0, 0, 0, 5],
    [0, 7, 0, 3, 0, 0, 0, 1, 2],
    [1, 2, 0, 0, 0, 7, 4, 0, 0],
    [0, 4, 9, 2, 0, 6, 0, 0, 7, 11]
  ];
  static var _solution = [
    [7, 8, 5, 4, 3, 9, 1, 2, 6],
    [6, 1, 2, 8, 7, 5, 3, 4, 9],
    [4, 9, 3, 6, 2, 1, 5, 7, 8],
    [8, 5, 7, 9, 4, 3, 2, 6, 1],
    [2, 6, 1, 7, 5, 8, 9, 3, 4],
    [9, 3, 4, 1, 6, 2, 7, 8, 5],
    [5, 7, 8, 3, 9, 4, 6, 1, 2],
    [1, 2, 6, 5, 8, 7, 4, 9, 3],
    [3, 4, 9, 2, 1, 6, 8, 5, 7, 11]
  ];

  dynamic _bo = [
    {
      'board': _board,
      'current': _current,
      'solution': _solution,
    },
    {
      'board': _board,
      'current': _current,
      'solution': _solution,
    },
    {
      'board': _board,
      'current': _current,
      'solution': _solution,
    },
  ];

  dynamic getBoard(int difficulty) {
    return (_bo[difficulty]['board']);
  }

  dynamic getCurrentBoard(int difficulty) {
    return (_bo[difficulty]['current']);
  }

  dynamic getSolution(int difficulty) {
    return (_bo[difficulty]['solution']);
  }

  void setNumber(int difficulty, int x, int y, int num) {
    if (_bo[difficulty]['board'][x][y] == 0 && num != 0) {
      _bo[difficulty]['current'][x][y] = num;
      print('added');
    }
  }

  void erase(int difficulty, int x, int y) {
    if (_bo[difficulty]['board'][x][y] == 0)
      _bo[difficulty]['current'][x][y] = 0;
  }
}
