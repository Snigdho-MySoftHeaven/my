import 'package:get/get.dart';

import '../controllers/qrcoode_controller.dart';

class QrcoodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QrcoodeController>(
      () => QrcoodeController(),
    );
  }
}
