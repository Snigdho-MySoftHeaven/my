import 'package:get/get.dart';

RxBool bn = false.obs;
void toggle() => bn.value = !bn.value;
final count = 0.obs;
List<String> mykeyList = [];
List<List<String>> keyList = [];
void liststring(String s) {
  keyList = [];
  s.split('<h2>').forEach((element) {
    if (element.contains('</h2>')) {
      if (mykeyList.isEmpty) {
        keyList.add([
          '<h2>${element.split('</h2>').first}',
          element.split('</h2>').last
        ]);
      } else {
        if (element.contains('</h2>')) {
          keyList.add([
            '<h2>${element.split('</h2>').first}',
            element.split('</h2>').last
          ]);
        }
      }
    }
  });
  print(keyList);
}

void sub(String element) {
  element.split('<p>').forEach((element) {
    if (element.contains('</p>')) {
      keyList[count.value].add(element);
    }
    // element.split('<br>').forEach((element) {
    //   if (element.contains('</br>')) {
    //     keyList[count.value].add(element);
    //   }
    //   element.split('</h3>').forEach((element) {
    //     print(element);
    //     if (element.contains('<h3>')) {
    //       if (mykeyList.isEmpty) {
    //         keyList.add([element]);
    //       } else {
    //         count.value++;
    //         keyList.add([element]);
    //       }
    //     } else {}
    //   });
    // });
  });
}

translate(var text) {
  String m = '';
  text = text.toString();
  text.split('').forEach((element) {
    try {
      m += element.toString().tr;
    } catch (e) {
      m += element;
    }
  });
  return m;
}
