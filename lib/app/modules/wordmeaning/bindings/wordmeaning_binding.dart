import 'package:get/get.dart';

import '../controllers/wordmeaning_controller.dart';

class WordmeaningBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WordmeaningController>(
      () => WordmeaningController(),
    );
  }
}
