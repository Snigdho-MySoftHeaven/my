import 'package:get/get.dart';

import '../../../data/All_data.dart';

class WordmeaningController extends GetxController {
  //TODO: Implement WordmeaningController
  List<String> keyList = [];

  final count = 0.obs;
  @override
  void onInit() {
    liststring(word_data);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void liststring(String s) {
    keyList = [];
    s.split('</h2>').forEach((element) {
      if (element.contains('<h2>')) {
        keyList.add(element);
      } else {
        element.split('<p>').forEach((element) {
          if (element.contains('</p>')) {
            keyList.add(element);
          } else {
            element.split('<br>').forEach((element) {
              if (element.contains('</br>')) {
                keyList.add(element);
              } else {
                element.split('<h3>').forEach((element) {
                  if (element.contains('</h3>')) {
                    keyList.add(element);
                  } else {}
                });
              }
            });
          }
        });
      }
    });
    print(keyList);
  }
}
