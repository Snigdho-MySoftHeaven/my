import 'package:get/get.dart';

class DolilRegistrationController extends GetxController {
  //TODO: Implement DolilRegistrationController
  final count = 0.obs;
  final key = ''.obs;
  final mykeyList = [].obs;

  @override
  void onInit() {
    key.value = '';
    count.value = 0;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    key.value = '';
  }
}
