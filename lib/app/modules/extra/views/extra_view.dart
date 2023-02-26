import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../custom_widget/card_glass_frost.dart';
import '../controllers/extra_controller.dart';

class ExtraView extends GetView<ExtraController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: Text('বিবিধ'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Wrap(
              runAlignment: WrapAlignment.center,
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 10.0,
              runSpacing: 10.0,
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed('/units');
                  },
                  child: Glass_card(
                    height: 120,
                    width: MediaQuery.of(context).size.width / 2 - 20,
                    gredientColor: [
                      Colors.deepPurple.shade800,
                      Color(0xff5BB318),
                    ],
                    child: Center(
                        child: Text('জমির একক জানুন',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.white,
                            ))),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed('/word_meaning');
                  },
                  child: Glass_card(
                    height: 120,
                    width: MediaQuery.of(context).size.width / 2 - 20,
                    gredientColor: [
                      Colors.deepPurple.shade800,
                      Color(0xff5BB318),
                    ],
                    child: Center(
                        child: Text('ভূমিসেবায় গুরুত্বপূর্ণ শব্দের অর্থ  ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.white,
                            ))),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
