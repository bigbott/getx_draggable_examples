import 'package:get/get.dart';

import 'official_controller.dart';

class OfficialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OfficialController>(
      () => OfficialController(),
    );
  }
}
