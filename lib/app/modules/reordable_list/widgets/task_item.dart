import 'package:flutter/material.dart';

final class TaskItem extends StatelessWidget {
  final String task;
  final bool isDragging;
  final bool isHighlighted;

  const TaskItem({
    super.key,
    required this.task,
    this.isDragging = false,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isHighlighted 
          ? Colors.blue.shade100 
          : isDragging 
            ? Colors.blue.shade50 
            : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isDragging 
            ? Colors.blue.shade300 
            : Colors.grey.shade300,
          width: isDragging ? 2 : 1,
        ),
        boxShadow: isDragging 
          ? [
              BoxShadow(
                color: Colors.blue.withValues(alpha: 0.3),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ]
          : [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.drag_indicator, 
            color: isDragging ? Colors.blue : Colors.grey,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              task,
              style: TextStyle(
                fontSize: 16,
                color: isDragging ? Colors.blue.shade700 : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
