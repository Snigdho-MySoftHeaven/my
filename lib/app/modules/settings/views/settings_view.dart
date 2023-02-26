import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                'English',
                style: TextStyle(
                    fontWeight:
                        controller.count.value ? null : FontWeight.bold),
              ),
              onTap: () {
                controller.setLanguage('en');
              },
            ),
            ListTile(
              title: Text('Bangla',
                  style: TextStyle(
                      fontWeight:
                          controller.count.value ? FontWeight.bold : null)),
              onTap: () {
                controller.setLanguage('bn');
              },
            ),
          ],
        ),
      ),
    );
  }
}
