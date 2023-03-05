import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

import '../modules/calculation/controllers/calculation_controller.dart';
import 'helper_functions.dart';

void generatePDF() async {
  final font = bn.value
      ? await rootBundle.load("assets/fonts/kalpurush/kalpurush.ttf")
      : await rootBundle.load("assets/fonts/Roboto/Roboto-Regular.ttf");
  final ttf = Font.ttf(font);
  final pdf = pw.Document();
  final controller = Get.put(CalculationController());
  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Center(
          child: Container(
            padding: EdgeInsets.only(top: 20.0),
            child: Container(
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
                            top: 40, bottom: 30, left: 10, right: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: PdfColor.fromInt(0xff92D45E),
                            width: 1.sp,
                          ),
                          color: PdfColors.white,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Container(
                          padding: EdgeInsets.only(top: 10),
                          child: Wrap(
                            direction: Axis.horizontal,
                            runSpacing: 30,
                            spacing: 10,
                            children: [
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                      'প্রথম জমি'.tr,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          font: ttf,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold,
                                          color: PdfColor.fromInt(0xff92D45E)),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  pw.Text(
                                    'প্রথম দৈর্ঘ্য'.tr,
                                    style: TextStyle(
                                      font: ttf,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                  pw.Text(
                                    translate(controller.height1.value.text),
                                    style: TextStyle(
                                      font: ttf,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                  pw.Container(
                                    height: 40,
                                    width: 1,
                                    color: PdfColors.grey,
                                    margin: const EdgeInsets.only(
                                        left: 10.0, right: 10.0),
                                  ),
                                  pw.Text(
                                    'প্রথম প্রস্থ'.tr,
                                    style: TextStyle(
                                      font: ttf,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                  pw.Text(
                                    translate(controller.width1.value.text),
                                    style: TextStyle(
                                      font: ttf,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                      'দ্বিতীয় জমি'.tr,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          font: ttf,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold,
                                          color: PdfColor.fromInt(0xff92D45E)),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  pw.Text(
                                    'দ্বিতীয় দৈর্ঘ্য'.tr,
                                    style: TextStyle(
                                      font: ttf,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                  pw.Text(
                                    translate(controller.height1.value.text),
                                    style: TextStyle(
                                      font: ttf,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                  pw.Container(
                                    height: 40,
                                    width: 1,
                                    color: PdfColors.grey,
                                    margin: const EdgeInsets.only(
                                        left: 10.0, right: 10.0),
                                  ),
                                  pw.Text(
                                    'দ্বিতীয় প্রস্থ'.tr,
                                    style: TextStyle(
                                      font: ttf,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                  pw.Text(
                                    translate(controller.width2.value.text),
                                    style: TextStyle(
                                      font: ttf,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                ],
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
                                color: PdfColor.fromInt(0xff348739),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Text(
                              'ভূমি পরিমাপ ক্যালকুলেটর'.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  font: ttf,
                                  color: PdfColors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10, top: 30),
                        padding: const EdgeInsets.only(
                            top: 20, bottom: 50, left: 10, right: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: PdfColor.fromInt(0xff92D45E),
                            width: 1.sp,
                          ),
                          color: PdfColors.white,
                          borderRadius: BorderRadius.circular(5.r),
                          boxShadow: [
                            BoxShadow(
                              color: PdfColors.grey,
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset:
                                  PdfPoint(0, 2), // changes position of shadow
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
                                          font: ttf,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(
                                    '    ${translate(controller.area.value)} ${'বর্গ ফুট'.tr}',
                                    style: TextStyle(
                                        font: ttf,
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
                                          font: ttf,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(
                                    '    ${translate(controller.areapersent.value)} ${'শতাংশ'.tr}',
                                    style: TextStyle(
                                        font: ttf,
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
                                          font: ttf,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(
                                    '    ${translate(controller.areaperkatha.value)} ${'কাঠা'.tr}',
                                    style: TextStyle(
                                        font: ttf,
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
                                          font: ttf,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(
                                    '    ${translate(controller.areaperbigha.value)} ${'বিঘা'.tr}',
                                    style: TextStyle(
                                        font: ttf,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
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
                                color: PdfColor.fromInt(0xff348739),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Text(
                              'ফলাফল'.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  font: ttf,
                                  color: PdfColors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
  final output = await getApplicationDocumentsDirectory();
  final file = File("${output.path}/result.pdf");
  await file.writeAsBytes(await pdf.save());
  await OpenFilex.open(file.path);
}
