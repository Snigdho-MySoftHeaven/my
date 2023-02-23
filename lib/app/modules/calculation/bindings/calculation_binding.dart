import 'package:get/get.dart';

import '../controllers/calculation_controller.dart';

class CalculationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CalculationController>(
      () => CalculationController(),
    );
  }
}
