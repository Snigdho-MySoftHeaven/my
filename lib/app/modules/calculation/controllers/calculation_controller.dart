import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utils/helper_functions.dart';

class CalculationController extends GetxController {
  //TODO: Implement CalculationController
  final GlobalKey<FormState> Calculate_FormKey = GlobalKey<FormState>();
  Rx<TextEditingController> height1 = TextEditingController().obs;
  Rx<TextEditingController> height2 = TextEditingController().obs;
  Rx<TextEditingController> width1 = TextEditingController().obs;
  Rx<TextEditingController> width2 = TextEditingController().obs;
  final h1 = 0.0.obs;
  final h2 = 0.0.obs;
  final w1 = 0.0.obs;
  final w2 = 0.0.obs;
  final area = 0.0.obs;
  final areapersent = ''.obs;
  final areaperbigha = ''.obs;
  final areaperkatha = ''.obs;

  @override
  void onInit() {
    height1.value.text = '';
    height2.value.text = '';
    width1.value.text = '';
    width2.value.text = '';
    bn.value = Get.locale!.languageCode == 'bn';
  }

  @override
  void dispose() {
    height1.value.dispose();
    height2.value.dispose();
    width1.value.dispose();
    width2.value.dispose();
    super.dispose();
  }

  void clear() {
    height1.value.text = '';
    height2.value.text = '';
    width1.value.text = '';
    width2.value.text = '';
    area.value = 0.0;
  }

  translator(var text) {
    String m = '';
    text = text.toString();
    text.split('').forEach((element) {
      switch (element) {
        case '০':
          m += '0';
          break;
        case '১':
          m += '1';
          break;
        case '২':
          m += '2';
          break;
        case '৩':
          m += '3';
          break;
        case '৪':
          m += '4';
          break;
        case '৫':
          m += '5';
          break;
        case '৬':
          m += '6';
          break;
        case '৭':
          m += '7';
          break;
        case '৮':
          m += '8';
          break;
        case '৯':
          m += '9';
          break;
        default:
          m += element;
      }
    });
    return m;
  }

  @override
  void onClose() {}
  void calculateArea() {
    if (Calculate_FormKey.currentState!.validate()) {
      h1.value = double.parse(translator(height1.value.text));
      h2.value = double.parse(translator(height2.value.text));
      w1.value = double.parse(translator(width1.value.text));
      w2.value = double.parse(translator(width2.value.text));
      double h = (h1.value + h2.value) / 2;
      double w = (w1.value + w2.value) / 2;
      double a = h * w;
      area.value = double.parse(translator(a));
      areapersent.value = translator((a / 435.6).toPrecision(4));

      areaperbigha.value = translator((a / 14400).toPrecision(4));
      areaperkatha.value = translator((a / 720).toPrecision(4));
    }
  }

  //create a function to generate pdf with desire location
}
