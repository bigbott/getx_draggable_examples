import 'package:get/get.dart';

class ReorderableListController extends GetxController {
  final tasks = <String>[
    'Buy groceries',
    'Call plumber',
    'Finish project',
    'Book doctor appointment',
    'Pay electric bill'
  ];

  int draggedIndex = -1;

  void reorderTask(int oldIndex, int newIndex) {
    final String task = tasks.removeAt(oldIndex);
    tasks.insert(newIndex, task);
    update();
  }

  void onDragStarted(index) {
    draggedIndex = index;
    update();
  }

  void onDragEnded() {
    draggedIndex = -1;
    update();
  }
}
