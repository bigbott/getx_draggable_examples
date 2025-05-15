import 'package:get/get.dart';

import 'reorderable_list_controller.dart';

class ReordableListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReorderableListController>(
      () => ReorderableListController(),
    );
  }
}
