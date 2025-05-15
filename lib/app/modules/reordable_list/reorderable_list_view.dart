import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_draggable_examples/app/modules/reordable_list/reorderable_list_controller.dart';
import 'package:getx_draggable_examples/app/modules/reordable_list/widgets/draggable_task.dart';


class ReordableListView extends GetView<ReorderableListController> {
  const ReordableListView({super.key});
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text('Reorderable Task List'),
      ),
      body: 
      GetBuilder<ReorderableListController>(
        builder: (controller) {
          return ListView.builder(
                padding: EdgeInsets.all(16),
                itemCount: controller.tasks.length,
                itemBuilder: (context, index) {
                  return DraggableTask(index:index);
                },
              );
        }
      )
    );
  }

 
}