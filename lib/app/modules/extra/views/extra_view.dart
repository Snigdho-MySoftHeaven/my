import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vumi/app/custom_widget/customCard.dart';

import '../controllers/extra_controller.dart';

class ExtraView extends GetView<ExtraController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarView(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Wrap(
                runAlignment: WrapAlignment.center,
                alignment: WrapAlignment.spaceEvenly,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 10.0,
                runSpacing: 10.0,
                children: [
                  customCardView(
                      text: 'জমির একক জানুন',
                      onTap: () => Get.toNamed('/units')),
                  customCardView(
                      text: 'ভূমিসেবায় গুরুত্বপূর্ণ শব্দের অর্থ',
                      onTap: () => Get.toNamed('/word_meaning')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar appBarView() {
    return AppBar(
      backgroundColor: Color(0xff348739),
      leading: Obx(() => controller.key.value.isEmpty
          ? IconButton(
              onPressed: () => Get.back(),
              icon: Icon(Icons.arrow_back_ios),
            )
          : IconButton(
              onPressed: () {
                controller.key.value = '';
              },
              icon: Icon(Icons.arrow_back_ios),
            )),
      title: Text('বিবিধ'.tr),
      centerTitle: true,
    );
  }
}
