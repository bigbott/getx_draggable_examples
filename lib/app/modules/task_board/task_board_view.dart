import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_draggable_examples/app/data/task_category.dart';

import 'task_board_controller.dart';

class TaskBoardView extends GetView<TaskBoardController> {
  const TaskBoardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Board'),
      ),
      body: GetBuilder<TaskBoardController>(builder: (controller) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.all(16),
          itemCount: controller.categories.length,
          itemBuilder: (context, categoryIndex) {
            final category = controller.categories[categoryIndex];
            return CategoryColumn(
              category: category,
              categoryIndex: categoryIndex,
            );
          },
        );
      }),
    );
  }
}

class CategoryColumn extends GetView<TaskBoardController> {
  const CategoryColumn({
    super.key,
    required this.category,
    required this.categoryIndex,
  });

  final TaskCategory category;
  final int categoryIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: category.color.withValues(alpha: .2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: category.color,
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            ),
            child: Row(
              children: [
                Text(
                  category.name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8),
                CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.white.withValues(alpha: .5),
                  child: Text(
                    '${category.tasks.length}',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: DragTarget<Map<String, dynamic>>(
              builder: (context, candidateData, rejectedData) {
                return Container(
                  color:
                      candidateData.isNotEmpty ? category.color.withValues(alpha: 0.3) : null,
                  padding: EdgeInsets.all(8),
                  child: ListView.builder(
                    padding: EdgeInsets.only(bottom: 100),
                    itemCount: category.tasks.length,
                    itemBuilder: (context, taskIndex) {
                      return DraggableTask(
                          context: context,
                          taskName: category.tasks[taskIndex],
                          categoryIndex: categoryIndex,
                          );
                    },
                  ),
                );
              },
              onAcceptWithDetails: (details) {
                controller.moveTask(
                  details.data['taskName'],
                  details.data['fromCategoryIndex'],
                  categoryIndex,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DraggableTask extends GetView<TaskBoardController> {
  const DraggableTask({
    super.key,
    required this.context,
    required this.taskName,
    required this.categoryIndex,
  });

  final BuildContext context;
  final String taskName;
  final int categoryIndex;

  @override
  Widget build(BuildContext context) {
    return Draggable<Map<String, dynamic>>(
      data: {
        'taskName': taskName,
        'fromCategoryIndex': categoryIndex,
      },
      feedback: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: 260,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            taskName,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
      childWhenDragging: Opacity(
        opacity: 0.3,
        child: TaskCard(taskName: taskName),
      ),
      child: TaskCard(taskName: taskName),
    );
  }
}

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.taskName,
  });

  final String taskName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Text(
        taskName,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
