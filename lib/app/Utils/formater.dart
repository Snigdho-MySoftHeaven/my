import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BanglaDigitInputFormatter extends TextInputFormatter {
  // regular expression to match Bangla digits
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // iterate through the new value's characters and replace non-Bangla digits with an empty string
    final newText = newValue.text.replaceAll(RegExp(r'[^\d]+'), '');
    late final String lastText;
    if (newValue.text.contains(RegExp(r'[০-৯]'))) {
      lastText = newText;
    } else {
      lastText = newText.replaceAllMapped(
        RegExp(r'[0-9]'),
        (match) => match[0]!.tr,
      );
    }

    return TextEditingValue(
      text: lastText,
      selection: TextSelection.collapsed(offset: lastText.length + 1),
    );
  }
}
