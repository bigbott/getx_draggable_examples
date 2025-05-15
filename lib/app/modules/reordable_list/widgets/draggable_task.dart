import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_draggable_examples/app/modules/reordable_list/reorderable_list_controller.dart';
import 'package:getx_draggable_examples/app/modules/reordable_list/widgets/task_item.dart';

final class DraggableTask extends GetView<ReorderableListController> {
  final int index;

  const DraggableTask({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
      return GetBuilder<ReorderableListController>(builder: (controller) {
        final bool isDragging = controller.draggedIndex == index;
        final String task = controller.tasks[index];
        return Draggable<int>(
          data: index,
          onDragStarted: () => controller.onDragStarted(index),
          onDragEnd: (_) => controller.onDragEnded(),
          feedback: Material(
            elevation: 4,
            child: Container(
              width: MediaQuery.of(context).size.width - 32,
              padding: EdgeInsets.all(16),
              color: Colors.blue.shade200,
              child: Text(
                task,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          childWhenDragging: Opacity(
            opacity: 0.3,
            child: TaskItem(task: task),
          ),
          child: DragTarget<int>(
            builder: (context, candidateData, rejectedData) {
              return TaskItem(
                task: task,
                isDragging: isDragging,
                isHighlighted: candidateData.isNotEmpty,
              );
            },
            onAcceptWithDetails: (details) {
              controller.reorderTask(details.data, index);
            },
          ),
        );
      });
  }
}
