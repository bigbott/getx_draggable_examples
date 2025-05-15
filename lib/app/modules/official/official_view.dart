import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_draggable_examples/app/common/extensions/text.dart';

import 'official_controller.dart';

class OfficialView extends GetView<OfficialController> {
  const OfficialView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<OfficialController>(
        builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Draggable<int>(
                    // Data is the value this Draggable stores.
                    data: 10,
                    onDragStarted: controller.onDragStarted,
                    onDragUpdate: (details) {
                      controller.onDragUpdate(details);
                    },
                    onDragEnd: (details) {
                       controller.onDragEnd(details);
                    } ,
                    onDragCompleted:  controller.onDragCompleted,
                    feedback: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.deepOrange.shade300,
                        height: 100,
                        width: 100,
                        child: Column(
                          children: [
                            Text('Draggable').withStyle(fontSize: 12, color: Colors.black),
                            Text('feedback').withStyle(fontSize: 16, color: Colors.black),
                          ],
                        )
                      ),
                    ),
                    childWhenDragging: Container(
                      height: 100.0,
                      width: 100.0,
                      color: Colors.pink.shade200,
                      child:  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: Column(
                          children: [
                            Text('Draggable'),
                            Text('Child When Dragging'),
                          ],
                        )),
                      ),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: Container(
                        height: 100.0,
                        width: 100.0,
                        color: Colors.lightGreenAccent,
                        child:  Center(child: Column(
                          children: [
                            Text('Draggable'),
                            Text ('child').withStyle(fontSize: 16),
                          ],
                        )),
                      ),
                    ),
                  ),
                  DragTarget<int>(
                    builder: (BuildContext context, List<dynamic> accepted, List<dynamic> rejected) {
                      return Container(
                        height: 100.0,
                        width: 100.0,
                        color: Colors.cyan,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Column(
                            children: [
                              Text('DragTarget').withStyle(fontSize: 16),
                              Text('Value is updated to: ${controller.acceptedData}'),
                            ],
                          )),
                        ),
                      );
                    },
                    onAcceptWithDetails: (DragTargetDetails<int> details) {
                      controller.onAcceptWithDetails(details);
                    },
                  ),
                  
                ],
              ),
              Text(controller.isDragging ? 'OnDragUpdate: x: ${controller.position.dx}, y:${controller.position.dy}' : ''),
            ],
          );
        }
      ),
    );
  }
}