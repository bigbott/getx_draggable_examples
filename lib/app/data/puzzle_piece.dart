class PuzzlePiece {
  final int id;
  final String imagePath;
  bool isPlaced;
  
  PuzzlePiece({
    required this.id,
    required this.imagePath,
    this.isPlaced = false,
  });
}