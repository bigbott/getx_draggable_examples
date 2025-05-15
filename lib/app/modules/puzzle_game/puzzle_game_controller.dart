import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_draggable_examples/app/data/puzzle_piece.dart';

class PuzzleGameController extends GetxController {
  List<PuzzlePiece> puzzlePieces = [
    PuzzlePiece(id: 1, imagePath: 'assets/puzzle/piece1.png'),
    PuzzlePiece(id: 2, imagePath: 'assets/puzzle/piece2.png'),
    PuzzlePiece(id: 3, imagePath: 'assets/puzzle/piece3.png'),
    PuzzlePiece(id: 4, imagePath: 'assets/puzzle/piece4.png'),
  ];
  
  Map<int, bool> placedPieces = {
    1: false,
    2: false,
    3: false,
    4: false,
  };
  
  void placePiece(int pieceId) {
    // Find the piece and mark it as placed
    final pieceIndex = puzzlePieces.indexWhere((piece) => piece.id == pieceId);
    if (pieceIndex != -1) {
      puzzlePieces[pieceIndex].isPlaced = true;
    }
    
    // Update the placed pieces map
    placedPieces[pieceId] = true;
    
    update();
    
    // Check if puzzle is complete
    if (placedPieces.values.every((isPlaced) => isPlaced)) {
      Future.delayed(Duration(milliseconds: 500), () {
        Get.defaultDialog(
          title: 'Congratulations!',
          middleText: 'You completed the puzzle!',
          textConfirm: 'Play Again',
          confirmTextColor: Colors.white,
          onConfirm: () {
            resetPuzzle();
            Get.back();
          },
        );
      });
    }
  }
  
  void resetPuzzle() {
    for (var piece in puzzlePieces) {
      piece.isPlaced = false;
    }
    
    placedPieces.updateAll((key, value) => false);
    
    update();
  }
  
  bool isPieceCorrect(int targetId, int pieceId) {
    return targetId == pieceId;
  }
}