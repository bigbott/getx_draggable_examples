import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_draggable_examples/app/data/puzzle_piece.dart';

import 'puzzle_game_controller.dart';

class PuzzleGameView extends GetView<PuzzleGameController> {
  const PuzzleGameView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Puzzle Game'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => controller.resetPuzzle(),
          ),
        ],
      ),
      body: GetBuilder<PuzzleGameController>(
        builder: (controller) {
          return Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.all(16),
                  color: Colors.blue.shade50,
                  child: Center(
                    child: GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      children: List.generate(4, (index) {
                        final targetId = index + 1;
                        return _buildPuzzleTarget(targetId, controller);
                      }),
                    ),
                  ),
                ),
              ),
              Divider(height: 2, thickness: 2),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(16),
                  color: Colors.grey.shade200,
                  child: Center(
                    child: Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      alignment: WrapAlignment.center,
                      children: controller.puzzlePieces
                          .where((piece) => !piece.isPlaced)
                          .map((piece) => _buildDraggablePiece(piece, controller))
                          .toList(),
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      ),
    );
  }
  
  Widget _buildPuzzleTarget(int targetId, PuzzleGameController controller) {
    final isPlaced = controller.placedPieces[targetId] ?? false;
    
    return DragTarget<int>(
      builder: (context, candidateData, rejectedData) {
        return Container(
          decoration: BoxDecoration(
            color: candidateData.isNotEmpty
                ? Colors.green.withOpacity(0.3)
                : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isPlaced ? Colors.green : Colors.blue.shade200,
              width: 2,
            ),
          ),
          child: isPlaced
              ? Center(
                  child: PlaceholderPuzzlePiece(
                    id: targetId,
                    isPlaced: true,
                  ),
                )
              : Center(
                  child: Text(
                    '$targetId',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade200,
                    ),
                  ),
                ),
        );
      },
      onWillAccept: (pieceId) {
        // Only accept if this is the correct target for this piece
        // and the target is not already filled
        return pieceId != null &&
            controller.isPieceCorrect(targetId, pieceId) &&
            !controller.placedPieces[targetId]!;
      },
      onAccept: (pieceId) {
        controller.placePiece(pieceId);
      },
    );
  }
  
  Widget _buildDraggablePiece(PuzzlePiece piece, PuzzleGameController controller) {
    return Draggable<int>(
      data: piece.id,
      feedback: Material(
        elevation: 4,
        color: Colors.transparent,
        child: PlaceholderPuzzlePiece(
          id: piece.id,
          size: 70,
        ),
      ),
      childWhenDragging: Opacity(
        opacity: 0.3,
        child: PlaceholderPuzzlePiece(
          id: piece.id,
          size: 60,
        ),
      ),
      child: PlaceholderPuzzlePiece(
        id: piece.id,
        size: 60,
      ),
    );
  }
}

// Since we don't have actual puzzle images, this is a placeholder
class PlaceholderPuzzlePiece extends StatelessWidget {
  final int id;
  final double size;
  final bool isPlaced;
  
  PlaceholderPuzzlePiece({
    required this.id,
    this.size = 100,
    this.isPlaced = false,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: _getColorForPiece(),
        borderRadius: BorderRadius.circular(12),
        boxShadow: isPlaced
            ? []
            : [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
      ),
      child: Center(
        child: Text(
          '$id',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
  
  Color _getColorForPiece() {
    switch (id) {
      case 1:
        return Colors.red;
      case 2:
        return Colors.blue;
      case 3:
        return Colors.green;
      case 4:
        return Colors.orange;
      default:
        return Colors.purple;
    }
  }
}