import 'package:get/get.dart';

import '../controllers/extra_controller.dart';

class ExtraBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExtraController>(
      () => ExtraController(),
    );
  }
}
