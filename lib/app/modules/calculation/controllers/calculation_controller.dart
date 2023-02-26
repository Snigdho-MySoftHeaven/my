import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:translator/translator.dart';

class CalculationController extends GetxController {
  //TODO: Implement CalculationController
  final GlobalKey<FormState> Calculate_FormKey = GlobalKey<FormState>();
  Rx<TextEditingController> height1 = TextEditingController().obs;
  Rx<TextEditingController> height2 = TextEditingController().obs;
  Rx<TextEditingController> width1 = TextEditingController().obs;
  Rx<TextEditingController> width2 = TextEditingController().obs;
  final area = 0.0.obs;
  final areapersent = 0.0.obs;
  final areaperbigha = 0.0.obs;
  final areaperkatha = 0.0.obs;

  @override
  void onInit() {
    tran();
    height1.value.text = '';
    height2.value.text = '';
    width1.value.text = '';
    width2.value.text = '';
  }

  @override
  void onReady() {
    super.onReady();
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

  @override
  void onClose() {}
  void calculateArea() {
    if (Calculate_FormKey.currentState!.validate()) {
      double h1 = double.parse(height1.value.text);
      double h2 = double.parse(height2.value.text);
      double w1 = double.parse(width1.value.text);
      double w2 = double.parse(width2.value.text);
      double h = (h1 + h2) / 2;
      double w = (w1 + w2) / 2;
      double a = h * w;
      area.value = (a);
      areapersent.value = (a / 435.6).toPrecision(4);
      areaperbigha.value = (a / 14400).toPrecision(4);
      areaperkatha.value = (a / 720).toPrecision(4);
      tran();
    }
  }

  tran() {
    final translator = GoogleTranslator();
    print('bn');
    translator
        .translate(area.value.toString(), to: 'bn')
        .then((value) => print(value));
  }
}
