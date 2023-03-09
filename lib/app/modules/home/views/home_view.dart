import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vumi/app/custom_widget/customCard.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff348739),
        title: Text("অন্যান্য সেবা".tr),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [bodyContentView()],
        ),
      ),
    );
  }
}

class bodyContentView extends StatelessWidget {
  const bodyContentView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runAlignment: WrapAlignment.spaceEvenly,
      alignment: WrapAlignment.spaceEvenly,
      spacing: 10.0,
      runSpacing: 10.0,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
        ),
        customCardView(
            text: 'দলিল রেজিস্ট্রি সংক্রান্ত',
            onTap: () => Get.toNamed('/dolil_registration')),
        customCardView(
          text: 'বিবিধ ',
          onTap: () {
            Get.toNamed('/extra');
          },
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              customCardView(
                text: 'settings',
                onTap: () {
                  Get.toNamed('/settings');
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
