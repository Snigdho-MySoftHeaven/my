import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vumi/app/custom_widget/customCard.dart';

import '../../../Utils/helper_functions.dart';
import '../../../data/All_data.dart';
import '../controllers/dolil_registration_controller.dart';

class DolilRegistrationView extends GetView<DolilRegistrationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: Obx(
            () => Container(
              padding: controller.key.value.isEmpty
                  ? EdgeInsets.only(top: 30.h)
                  : EdgeInsets.only(top: 20.h),
              decoration: BoxDecoration(
                  color: Color(0xff348739),
                  borderRadius: controller.key.value.isEmpty
                      ? BorderRadius.zero
                      : BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15))),
              alignment: Alignment.center,
              height: controller.key.value.isEmpty ? 75.h : 136.h,
              width: Get.width,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Obx(() => controller.key.value.isEmpty
                        ? IconButton(
                            onPressed: () => Get.back(),
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          )
                        : IconButton(
                            onPressed: () {
                              controller.key.value = '';
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          )),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Obx(() => controller.key.value.isEmpty
                        ? Text(
                            'দলিল রেজিস্ট্রি সংক্রান্ত তথ্য'.tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          )
                        : Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(left: 20, right: 10),
                            child: Text(
                              keyList.first.first
                                  .split('</h2>')
                                  .first
                                  .split('<h2>')
                                  .last,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          )),
                  )),
                ],
              ),
            ),
          ),
          preferredSize: Size(Get.width, 136.h)),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 10.0),
        child: Column(
          children: [
            Heading_View(
              controller: controller,
            ),
            Details_View(controller: controller),
          ],
        ),
      ),
    );
  }
}

class Heading_View extends StatelessWidget {
  const Heading_View({
    super.key,
    required this.controller,
  });

  final DolilRegistrationController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.key.value.isEmpty) {
        return Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Wrap(
            spacing: 25.0,
            runSpacing: 10.0,
            children: [
              for (var i = 0; i < data.keys.length; i++)
                customCardView(
                    text: data[data.keys.elementAt(i)]!
                        .split('</h2>')
                        .first
                        .split('<h2>')
                        .last,
                    onTap: () {
                      controller.key.value = data.keys.elementAt(i);
                      liststring(data[data.keys.elementAt(i)]!);
                    }),
            ],
          ),
        );
      }
      return Container();
    });
  }
}

class Details_View extends StatelessWidget {
  const Details_View({
    super.key,
    required this.controller,
  });

  final DolilRegistrationController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.key.value != '') {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int index = 0; index < keyList.length; index++)
                Column(
                  children: [
                    Card(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        width: double.infinity,
                        child: Html(
                            data: keyList[index].first,
                            shrinkWrap: true,
                            style: {
                              "html": Style(
                                fontSize: FontSize(18.0),
                              ),
                              'p': Style(
                                fontSize: FontSize(18.0),
                              ),
                              'h1': Style(
                                fontSize: FontSize(20.0),
                              ),
                              'h2': Style(
                                  fontSize: FontSize(20.0),
                                  color: Color(0xFF348739)),
                              'br': Style(
                                margin: EdgeInsets.only(bottom: 10.0),
                              ),
                            }),
                      ),
                    ),
                    Card(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        width: double.infinity,
                        child: Html(
                            data: keyList[index].last,
                            shrinkWrap: true,
                            style: {
                              "html": Style(
                                fontSize: FontSize(18.0),
                              ),
                              'p': Style(
                                fontSize: FontSize(18.0),
                              ),
                              'h1': Style(
                                fontSize: FontSize(20.0),
                              ),
                              'h2': Style(
                                fontSize: FontSize(20.0),
                              ),
                              'br': Style(
                                margin: EdgeInsets.only(bottom: 10.0),
                              ),
                            }),
                      ),
                    ),
                  ],
                )
            ],
          ),
        );
      }
      return Container(
        height: 0.0,
      );
    });
  }
}
