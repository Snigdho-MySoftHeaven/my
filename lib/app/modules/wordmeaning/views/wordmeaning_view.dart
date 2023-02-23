import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../../../Utils/helper_functions.dart';
import '../../../data/All_data.dart';
import '../controllers/wordmeaning_controller.dart';

class WordmeaningView extends GetView<WordmeaningController> {
  @override
  Widget build(BuildContext context) {
    liststring(word_data);
    return Scaffold(
      appBar: AppBar(
        title: Text('জমির একক জানুন'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 10.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  for (int i = 0; i < keyList.length; i++)
                    Card(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                        width: double.infinity,
                        child: Html(data: keyList[i], shrinkWrap: true, style: {
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
            ),
          ],
        ),
      ),
    );
  }
}
