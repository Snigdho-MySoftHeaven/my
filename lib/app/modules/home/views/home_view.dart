import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../custom_widget/card_glass_frost.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'.tr),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 10.0,
              runSpacing: 10.0,
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed('/dolil_registration');
                  },
                  child: Glass_card(
                    height: 120,
                    width: MediaQuery.of(context).size.width / 2 - 20,
                    gredientColor: [
                      Colors.deepPurple.shade800,
                      Color(0xff5BB318),
                    ],
                    child: Center(
                        child: Text('দলিল রেজিস্ট্রি সংক্রান্ত',
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
                    Get.toNamed('/extra');
                  },
                  child: Glass_card(
                    height: 120,
                    width: MediaQuery.of(context).size.width / 2 - 20,
                    gredientColor: [
                      Colors.deepPurple.shade800,
                      Color(0xff5BB318),
                    ],
                    child: Center(
                        child: Text('বিবিধ ',
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
                    Get.toNamed('/calculation');
                  },
                  child: Glass_card(
                    height: 120,
                    width: MediaQuery.of(context).size.width / 2 - 20,
                    gredientColor: [
                      Colors.deepPurple.shade800,
                      Color(0xff5BB318),
                    ],
                    child: Center(
                        child: Text('ভূমি পরিমাপ ক্যালকুলেটর',
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
                    Get.toNamed('/settings');
                  },
                  child: Glass_card(
                    height: 120,
                    width: MediaQuery.of(context).size.width / 2 - 20,
                    gredientColor: [
                      Colors.deepPurple.shade800,
                      Color(0xff5BB318),
                    ],
                    child: Center(
                        child: Text('settings'.tr,
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
