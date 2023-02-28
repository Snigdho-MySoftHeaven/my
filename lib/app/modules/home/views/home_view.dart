import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vumi/app/custom_widget/customCard.dart';

import '../../../custom_widget/floatingButton.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'.tr),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: floatingbutton(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.spaceEvenly,
              runAlignment: WrapAlignment.spaceEvenly,
              spacing: 10.0,
              runSpacing: 10.0,
              children: [
                customCardView(
                    text: 'দলিল রেজিস্ট্রি সংক্রান্ত',
                    onTap: () => Get.toNamed('/dolil_registration')),
                customCardView(
                  text: 'বিবিধ ',
                  onTap: () {
                    Get.toNamed('/extra');
                  },
                ),
                customCardView(
                  text: 'ভূমি পরিমাপ ক্যালকুলেটর',
                  onTap: () {
                    Get.toNamed('/calculation');
                  },
                ),
                customCardView(
                  text: 'Qr Code',
                  onTap: () {
                    Get.toNamed('/qr_code');
                  },
                ),
                customCardView(
                  text: 'settings',
                  onTap: () {
                    Get.toNamed('/settings');
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
