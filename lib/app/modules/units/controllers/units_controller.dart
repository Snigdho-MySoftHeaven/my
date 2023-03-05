import 'package:get/get.dart';
import 'package:translator/translator.dart';

class UnitsController extends GetxController {
  //TODO: Implement UnitsController
  final key = ''.obs;
  GoogleTranslator translator = GoogleTranslator();
  translate(String text) async {
    return (await translator.translate(text, to: 'bn')) as String;
  }

  @override
  void onInit() {
    key.value = '';
    super.onInit();
  }


  @override
  void onClose() {
    key.value = '';
  }
}
