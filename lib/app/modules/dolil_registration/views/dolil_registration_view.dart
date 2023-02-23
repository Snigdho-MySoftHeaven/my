import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../../../custom_widget/card_glass_frost.dart';
import '../../../data/All_data.dart';
import '../controllers/dolil_registration_controller.dart';

class DolilRegistrationView extends GetView<DolilRegistrationController> {
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
        title: Text('দলিল রেজিস্ট্রি সংক্রান্ত'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 10.0),
        child: Column(
          children: [
            Obx(() {
              if (controller.key.value.isEmpty) {
                return Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: [
                    for (var i = 0; i < data.keys.length; i++)
                      InkWell(
                        onTap: () {
                          controller.key.value = data.keys.elementAt(i);
                          controller.liststring(data[data.keys.elementAt(i)]!);
                        },
                        child: Glass_card(
                          height: 120,
                          width: MediaQuery.of(context).size.width / 2 - 20,
                          gredientColor: [
                            Colors.deepPurple.shade800,
                            Color(0xff5BB318),
                          ],
                          child: Center(
                              child: Text(
                                  data[data.keys.elementAt(i)]!
                                      .split('</h2>')
                                      .first
                                      .split('<h2>')
                                      .last,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    color: Colors.white,
                                  ))),
                        ),
                      ),
                  ],
                );
              }
              return Container();
            }),
            Obx(() {
              if (controller.key.value != '') {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (int i = 0; i < controller.keyList.length; i++)
                        Card(
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Container(
                            width: double.infinity,
                            child: Html(
                                data: controller.keyList[i],
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
                  ),
                );
              }
              return Container(
                height: 0.0,
              );
            }),
          ],
        ),
      ),
    );
  }
}
