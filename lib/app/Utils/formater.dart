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
      selection: TextSelection.collapsed(offset: lastText.length),
      composing: TextRange(start: 0, end: lastText.length - 1),
    );
  }
}

String convertToBengaliNumerals(String input) {
  String output = "";
  for (int i = 0; i < input.length; i++) {
    switch (input[i]) {
      case "0":
        output += "০";
        break;
      case "1":
        output += "১";
        break;
      case "2":
        output += "২";
        break;
      case "3":
        output += "৩";
        break;
      case "4":
        output += "৪";
        break;
      case "5":
        output += "৫";
        break;
      case "6":
        output += "৬";
        break;
      case "7":
        output += "৭";
        break;
      case "8":
        output += "৮";
        break;
      case "9":
        output += "৯";
        break;
      default:
        output += input[i];
    }
  }
  return output;
}
