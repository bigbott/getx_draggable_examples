import 'package:flutter/material.dart';

class TaskCategory {
  final String name;
  final Color color;
  List<String> tasks;
  
  TaskCategory({
    required this.name, 
    required this.color, 
    required this.tasks
  });
}