import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/calculation_controller.dart';

class CalculationView extends GetView<CalculationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text('ভূমি পরিমাপ ক্যালকুলেটর'),
        centerTitle: true,
      ),
      body: Container(
        child: Form(
          key: controller.Calculate_FormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: Get.height * .32,
                child: Card(
                  margin: EdgeInsets.all(15),
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 20, left: 10, right: 10),
                    child: Wrap(
                      direction: Axis.horizontal,
                      runSpacing: 30,
                      spacing: 10,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'ভূমি পরিমাপ ক্যালকুলেটর',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextFormField(
                              controller: controller.height1.value,
                              decoration: InputDecoration(
                                constraints: BoxConstraints(
                                  maxWidth: Get.width * 0.4,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: const BorderSide(
                                        color: Colors.blue, width: 1)),
                                labelText: 'প্রথম দৈর্ঘ্য',
                                hintText: 'প্রথম দৈর্ঘ্য ( ফুট )',
                              ),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'প্রথম দৈর্ঘ্য প্রদান করুন';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: controller.width1.value,
                              decoration: InputDecoration(
                                constraints: BoxConstraints(
                                  maxWidth: Get.width * 0.4,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: const BorderSide(
                                        color: Colors.blue, width: 1)),
                                labelText: 'প্রথম প্রস্থ',
                                hintText: 'প্রথম প্রস্থ ( ফুট )',
                              ),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'প্রথম প্রস্থ প্রদান করুন';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextFormField(
                              controller: controller.height2.value,
                              decoration: InputDecoration(
                                constraints: BoxConstraints(
                                  maxWidth: Get.width * 0.4,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: const BorderSide(
                                        color: Colors.blue, width: 1)),
                                labelText: 'দ্বিতীয় দৈর্ঘ্য',
                                hintText: 'দ্বিতীয় দৈর্ঘ্য ( ফুট )',
                              ),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'দ্বিতীয় দৈর্ঘ্য প্রদান করুন';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: controller.width2.value,
                              decoration: InputDecoration(
                                constraints: BoxConstraints(
                                  maxWidth: Get.width * 0.4,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: const BorderSide(
                                        color: Colors.blue, width: 1)),
                                labelText: 'দ্বিতীয় প্রস্থ',
                                hintText: 'দ্বিতীয় প্রস্থ ( ফুট )',
                              ),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'দ্বিতীয় প্রস্থ প্রদান করুন';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(12),
                        minimumSize: Size(150, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {
                        controller.Calculate_FormKey.currentState!.reset();
                        controller.clear();
                      },
                      child:
                          Text('পরিস্কার করুন', style: TextStyle(fontSize: 20)),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(150, 50),
                        padding: EdgeInsets.all(12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {
                        controller.Calculate_FormKey.currentState!.save();
                        controller.Calculate_FormKey.currentState!.validate();
                        controller.calculateArea();
                      },
                      child: Text('হিসাব করুন', style: TextStyle(fontSize: 20)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Obx(() {
                  if (controller.area.value != 0.0) {
                    return Card(
                      elevation: 10,
                      margin: EdgeInsets.all(15),
                      child: Container(
                        alignment: Alignment.center,
                        width: Get.width - 20,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'মোট পরিমান',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 1,
                                color: Colors.black,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: Get.width * 0.4,
                                    child: Text(
                                      'মোট ক্ষেত্রফল',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(
                                    ' :   ${controller.area.value} বর্গ ফুট',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: Get.width * 0.4,
                                    child: Text(
                                      'মোট শতাংশ',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(
                                    ' :   ${controller.areapersent.value} শতাংশ',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: Get.width * 0.4,
                                    child: Text(
                                      'মোট কাঠা ',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(
                                    ' :   ${controller.areaperkatha.value} বর্গ মিটার',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: Get.width * 0.4,
                                    child: Text(
                                      'মোট বিঘা ',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(
                                    ' :   ${controller.areaperbigha.value} বর্গ মিটার',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
