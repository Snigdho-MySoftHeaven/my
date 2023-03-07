import 'package:get/get.dart';

class UnitsController extends GetxController {
  //TODO: Implement UnitsController
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
