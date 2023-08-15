import 'values.dart';

class Piece {
  // type of tetris peice
  TetrominoType type;

  Piece({required this.type});

  // the piece is just a list of positions
  List<int> position = [];

  // generate the piece
  void initializePiece() {
    switch (type) {
      case TetrominoType.L:
        position = [4, 14, 24, 25];
        break;
      default:
    }
  }

  // move the piece
  void movePiece(Direction direction) {
    switch (direction) {
      case Direction.down:
        for (int i = 0; i < position.length; i++) {
          position[i] += rowLength;
        }
        break;
      case Direction.left:
        for (int i = 0; i < position.length; i++) {
          position[i] -= 1;
        }
        break;
      case Direction.right:
        for (int i = 0; i < position.length; i++) {
          position[i] += 1;
        }
        break;
      default:
    }
  }
}