import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_draggable_examples/app/data/task_category.dart';

class TaskBoardController extends GetxController {
  List<TaskCategory> categories = [
    TaskCategory(
      name: "To Do", 
      color: Colors.red.shade200,
      tasks: ["Research topic", "Create presentation", "Email client"]
    ),
    TaskCategory(
      name: "In Progress", 
      color: Colors.amber.shade200,
      tasks: ["Draft proposal", "Review code"]
    ),
    TaskCategory(
      name: "Done", 
      color: Colors.green.shade200,
      tasks: ["Set up meeting", "Create project repository"]
    ),
  ];
  
  void moveTask(String taskName, int fromCategoryIndex, int toCategoryIndex) {
    // Remove from original category
    categories[fromCategoryIndex].tasks.remove(taskName);
    
    // Add to new category
    categories[toCategoryIndex].tasks.add(taskName);
    
    update();
  }
}
