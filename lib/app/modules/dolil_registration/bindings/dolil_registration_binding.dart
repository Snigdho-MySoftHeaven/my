import 'package:get/get.dart';

import '../controllers/dolil_registration_controller.dart';

class DolilRegistrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DolilRegistrationController>(
      () => DolilRegistrationController(),
    );
  }
}
