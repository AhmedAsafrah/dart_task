import '../lib/game_board.dart';
import '../lib/game_utils.dart';

void main() {
  GameBoard gameBoard = GameBoard();
  String currentPlayer = 'X';

print('Welcome to Tic-Tac-Toe 🎮');
print('Players will take turns entering a number (1-9) to make a move');
print('The positions are numbered as follows:');
print('''
1 | 2 | 3
---+---+---
4 | 5 | 6
---+---+---
7 | 8 | 9
''');

  while (true) {
    gameBoard.display();

    print("Player '$currentPlayer', enter your move (1-9): ");
    int? move = getInput();

    if (move == null || !gameBoard.makeMove(move, currentPlayer)) {
      print('Invalid move. Please try again.');
      continue;
    }

    if (gameBoard.checkWin(currentPlayer)) {
      gameBoard.display();
      print("Player '$currentPlayer' wins!");
      break;
    } else if (gameBoard.isFull()) {
      gameBoard.display();
      print("It's a draw!");
      break;
    } else {
      // Switch players
      currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
    }
  }
  print('Thank you for playing');
}
