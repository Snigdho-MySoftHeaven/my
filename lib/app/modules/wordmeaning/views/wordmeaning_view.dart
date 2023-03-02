import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Utils/helper_functions.dart';
import '../../../custom_widget/floatingButton.dart';
import '../../../data/All_data.dart';
import '../controllers/wordmeaning_controller.dart';

class WordmeaningView extends GetView<WordmeaningController> {
  @override
  Widget build(BuildContext context) {
    liststring(word_data);
    return Scaffold(
      appBar: PreferredSize(
          child: Container(
            padding: EdgeInsets.only(top: 20.h),
            decoration: BoxDecoration(
                color: Color(0xff348739),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15))),
            alignment: Alignment.center,
            height: 136.h,
            width: Get.width,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    )),
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
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
                ),
              ],
            ),
          ),
          preferredSize: Size(Get.width, 136.h)),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: floatingbutton(),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 10.0),
        child: Column(
          children: [
            Padding(
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
            )
          ],
        ),
      ),
    );
  }
}
