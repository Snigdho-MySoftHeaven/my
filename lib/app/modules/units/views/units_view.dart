import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../../../Utils/helper_functions.dart';
import '../../../custom_widget/card_glass_frost.dart';
import '../../../custom_widget/custom_photo_view.dart';
import '../../../data/All_data.dart';
import '../controllers/units_controller.dart';

class UnitsView extends GetView<UnitsController> {
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
        title: Text('জমির একক জানুন '),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Heading_View(
              controller: controller,
            ),
            Details_View(
              controller: controller,
            )
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

  final UnitsController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.key.value.isEmpty) {
        return Wrap(
          spacing: 10.0,
          runSpacing: 10.0,
          runAlignment: WrapAlignment.start,
          children: [
            for (var i = 0; i < extra_data.keys.length; i++)
              InkWell(
                onTap: () {
                  controller.key.value = extra_data.keys.elementAt(i);
                  liststring(extra_data[extra_data.keys.elementAt(i)]!);
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
                          extra_data[extra_data.keys.elementAt(i)]!
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
    });
  }
}

class Details_View extends StatelessWidget {
  const Details_View({
    super.key,
    required this.controller,
  });

  final UnitsController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.key.value != '') {
        return Padding(
          padding: const EdgeInsets.all(0.0),
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
                              ),
                              'br': Style(
                                margin: EdgeInsets.only(bottom: 10.0),
                              ),
                            }),
                      ),
                    ),
                    extra_data[controller.key.value]!.contains('img src=')
                        ? InkWell(
                            onTap: () async {
                              ZoomImage(context, 'assets/images/img.png');
                            },
                            child: Image.asset(
                              'assets/images/img.png',
                              fit: BoxFit.cover,
                            ),
                          )
                        : Card(
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Container(
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
