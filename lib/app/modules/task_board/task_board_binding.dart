import 'package:get/get.dart';

import 'task_board_controller.dart';

class TaskBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TaskBoardController>(
      () => TaskBoardController(),
    );
  }
}
