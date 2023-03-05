import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utils/helper_functions.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff348739),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text('settings'.tr),
        centerTitle: true,
      ),
      body: Obx(
        () => Column(
          children: [
            ListTile(
              title: Text(
                'English'.tr,
                style: TextStyle(fontWeight: bn.value ? null : FontWeight.bold),
              ),
              onTap: () {
                controller.setLanguage('en');
                bn.value = false;
              },
            ),
            ListTile(
              title: Text('Bangla'.tr,
                  style:
                      TextStyle(fontWeight: bn.value ? FontWeight.bold : null)),
              onTap: () {
                controller.setLanguage('bn');
                bn.value = true;
              },
            ),
          ],
        ),
      ),
    );
  }
}
