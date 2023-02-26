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
                        Card(
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
            ),
          ],
        ),
      ),
    );
  }
}
