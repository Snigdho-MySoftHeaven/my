import 'package:get/get.dart';

class DolilRegistrationController extends GetxController {
  //TODO: Implement DolilRegistrationController
  final count = 0.obs;
  final key = ''.obs;
  List<String> keyList = [];

  @override
  void onInit() {
    key.value = '';
    keyList = [];
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    key.value = '';
    keyList = [];
  }

  void increment() => count.value++;

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
