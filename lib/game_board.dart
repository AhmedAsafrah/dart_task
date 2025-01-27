class GameBoard {
  List<List<String>> _board = List.generate(3, (_) => List.generate(3, (_) => ' '));

  /// Display the game board
  void display() {
    for (int i = 0; i < 3; i++) {
      print('${_board[i][0]} | ${_board[i][1]} | ${_board[i][2]}');
      if (i < 2) print('--+---+--');
    }
  }

  // Make a move on the board
  bool makeMove(int position, String marker) {
    int row = (position - 1) ~/ 3; // row index
    int col = (position - 1) % 3; // column index

    if (_board[row][col] == ' ') {
      _board[row][col] = marker;
      return true;
    }
    return false;
  }

  /// Check if the player with the given marker has won
  bool checkWin(String marker) {
    // Check rows and columns
    for (int i = 0; i < 3; i++) {
      if ((_board[i][0] == marker && _board[i][1] == marker && _board[i][2] == marker) ||
          (_board[0][i] == marker && _board[1][i] == marker && _board[2][i] == marker)) {
        return true;
      }
    }
    // Check diagonals
    if ((_board[0][0] == marker && _board[1][1] == marker && _board[2][2] == marker) ||
        (_board[0][2] == marker && _board[1][1] == marker && _board[2][0] == marker)) {
      return true;
    }
    return false;
  }

  /// Check if the board is full
  bool isFull() {
    return _board.every((row) => row.every((cell) => cell != ' '));
  }
}
