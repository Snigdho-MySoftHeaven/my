import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController {
  //TODO: Implement SettingsController

  final count = false.obs;
  @override
  Future<void> onInit() async {
    await Get.locale!.countryCode == 'bn'
        ? count.value = true
        : count.value = false;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void setLanguage(String languageCode) async {
    final storage = GetStorage();
    await storage.write('language', languageCode);
    await Get.updateLocale(Locale(languageCode));
    count.value = !count.value;
  }
}
