import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Utils/formater.dart';
import '../../../Utils/helper_functions.dart';
import '../../../Utils/pdfGenerator.dart';
import '../../../custom_widget/floatingButton.dart';
import '../controllers/calculation_controller.dart';

class CalculationView extends GetView<CalculationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff348739),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text('ভূমি পরিমাপ ক্যালকুলেটর'.tr),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: floatingbutton(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 20.0),
          child: Form(
            key: controller.Calculate_FormKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10, top: 30),
                      padding: const EdgeInsets.only(
                          top: 40, bottom: 20, left: 10, right: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xff92D45E),
                          width: 1.sp,
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Container(
                        child: Wrap(
                          direction: Axis.horizontal,
                          runSpacing: 30,
                          spacing: 10,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(
                                    'প্রথম জমি'.tr,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff92D45E)),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextFormField(
                                  controller: controller.height1.value,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(9),
                                    TextInputFormatter.withFunction(
                                        (oldValue, newValue) {
                                      String convertedText =
                                          convertToBengaliNumerals(
                                              newValue.text);
                                      print(convertedText.length);
                                      return TextEditingValue(
                                        text: convertedText,
                                        selection: TextSelection.fromPosition(
                                          TextPosition(
                                              offset: convertedText.isNotEmpty
                                                  ? newValue.text
                                                          .split('')
                                                          .length +
                                                      1
                                                  : 0),
                                        ),
                                      );
                                    }),
                                  ],
                                  decoration: InputDecoration(
                                    constraints: BoxConstraints(
                                      maxWidth: Get.width * 0.4,
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(6),
                                        borderSide: const BorderSide(
                                            color: Colors.blue, width: 1)),
                                    labelText: 'প্রথম দৈর্ঘ্য'.tr,
                                    hintText: 'প্রথম দৈর্ঘ্য'.tr + '( ফুট )'.tr,
                                  ),
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'প্রথম দৈর্ঘ্য প্রদান করুন'.tr;
                                    }
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  controller: controller.width1.value,
                                  inputFormatters: [
                                    bn.value
                                        ? BanglaDigitInputFormatter()
                                        : FilteringTextInputFormatter
                                            .digitsOnly,
                                  ],
                                  decoration: InputDecoration(
                                    constraints: BoxConstraints(
                                      maxWidth: Get.width * 0.4,
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(6),
                                        borderSide: const BorderSide(
                                            color: Colors.blue, width: 1)),
                                    labelText: 'প্রথম প্রস্থ'.tr,
                                    hintText: 'প্রথম প্রস্থ'.tr + '( ফুট )'.tr,
                                  ),
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'প্রথম প্রস্থ প্রদান করুন'.tr;
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(
                                    'দ্বিতীয় জমি'.tr,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff92D45E)),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextFormField(
                                  controller: controller.height2.value,
                                  inputFormatters: [
                                    bn.value
                                        ? BanglaDigitInputFormatter()
                                        : FilteringTextInputFormatter
                                            .digitsOnly,
                                  ],
                                  decoration: InputDecoration(
                                    constraints: BoxConstraints(
                                      maxWidth: Get.width * 0.4,
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(6),
                                        borderSide: const BorderSide(
                                            color: Colors.blue, width: 1)),
                                    labelText: 'দ্বিতীয় দৈর্ঘ্য'.tr,
                                    hintText:
                                        ('দ্বিতীয় দৈর্ঘ্য'.tr + '( ফুট )'.tr),
                                  ),
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'দ্বিতীয় দৈর্ঘ্য প্রদান করুন'.tr;
                                    }
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  controller: controller.width2.value,
                                  inputFormatters: [
                                    bn.value
                                        ? BanglaDigitInputFormatter()
                                        : FilteringTextInputFormatter
                                            .digitsOnly,
                                  ],
                                  decoration: InputDecoration(
                                    constraints: BoxConstraints(
                                      maxWidth: Get.width * 0.4,
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(6),
                                        borderSide: const BorderSide(
                                            color: Colors.blue, width: 1)),
                                    labelText: 'দ্বিতীয় প্রস্থ'.tr,
                                    hintText:
                                        ('দ্বিতীয় প্রস্থ'.tr + '( ফুট )'.tr),
                                  ),
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'দ্বিতীয় প্রস্থ প্রদান করুন'.tr;
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xff348739),
                                      padding: EdgeInsets.all(12),
                                      minimumSize: Size(150, 50),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                    ),
                                    onPressed: () {
                                      controller.Calculate_FormKey.currentState!
                                          .reset();
                                      controller.clear();
                                    },
                                    child: Text('পরিস্কার করুন'.tr,
                                        style: TextStyle(fontSize: 20)),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xff348739),
                                      minimumSize: Size(150, 50),
                                      padding: EdgeInsets.all(12),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                    ),
                                    onPressed: () {
                                      controller.Calculate_FormKey.currentState!
                                          .save();
                                      controller.Calculate_FormKey.currentState!
                                          .validate();
                                      controller.calculateArea();
                                    },
                                    child: Text('হিসাব করুন'.tr,
                                        style: TextStyle(fontSize: 20)),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        top: 0,
                        child: Container(
                          width: Get.width * 0.6,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Color(0xff348739),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Text(
                            'ভূমি পরিমাপ ক্যালকুলেটর'.tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Obx(() {
                  if (controller.area.value != 0.0) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10, right: 10, top: 30),
                          padding: const EdgeInsets.only(
                              top: 20, bottom: 50, left: 10, right: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xff92D45E),
                              width: 1.sp,
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 2), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: Get.width * 0.4,
                                      child: Text(
                                        'মোট ক্ষেত্রফল'.tr,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      '    ${translate(controller.area.value)} ${'বর্গ ফুট'.tr}',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: Get.width * 0.4,
                                      child: Text(
                                        'মোট শতাংশ'.tr,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      '    ${translate(controller.areapersent.value)} ${'শতাংশ'.tr}',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: Get.width * 0.4,
                                      child: Text(
                                        'মোট কাঠা'.tr,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      '    ${translate(controller.areaperkatha.value)} ${'কাঠা'.tr}',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: Get.width * 0.4,
                                      child: Text(
                                        'মোট বিঘা'.tr,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      '    ${translate(controller.areaperbigha.value)} ${'বিঘা'.tr}',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: TextButton(
                                    child: Text("Generate PDF"),
                                    onPressed: () {
                                      generatePDF();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                            top: 0,
                            child: Container(
                              width: Get.width * 0.6,
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: Color(0xff348739),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Text(
                                'ফলাফল'.tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      ],
                    );
                  } else {
                    return Container();
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
