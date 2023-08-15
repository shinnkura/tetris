import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tetris/piece.dart';
import 'package:tetris/pixel.dart';

import 'values.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  // current tetris piece
  Piece currentPiece = Piece(type: TetrominoType.L);

  @override
  void initState() {
    super.initState();

    // start game when app starts
    startGame();
  }

  void startGame() {
    // initialize the current piece
    currentPiece.initializePiece();

    // frame refresh rate
    Duration frameRate = const Duration(milliseconds: 800);
    gameLoop(frameRate);
  }

  // game loop
  void gameLoop(Duration frameRate) {
    Timer.periodic(
      frameRate,
      (timer) {
        setState(() {
          // move the piece down
          currentPiece.movePiece(Direction.down);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 1),
      body: GridView.builder(
        itemCount: rowLength * colLength,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: rowLength,
        ),
        itemBuilder: (context, index) {
          if (currentPiece.position.contains(index)) {
            return Pixel(
              color: Colors.yellow,
              child: index,
            );
          } else {
            return Pixel(
              color: Colors.grey[900],
              child: index,
            );
          }
        },
      ),
    );
  }
}
