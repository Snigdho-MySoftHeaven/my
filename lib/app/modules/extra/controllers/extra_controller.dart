import 'package:get/get.dart';

class ExtraController extends GetxController {
  //TODO: Implement ExtraController
  final key = ''.obs;

  @override
  void onInit() {
    key.value = '';
    super.onInit();
  }


  @override
  void onClose() {
    key.value = '';
  }
}
