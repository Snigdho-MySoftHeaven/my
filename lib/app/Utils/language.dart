import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../data/languageDictionary/banglaLanguage.dart';
import '../data/languageDictionary/englishLanguage.dart';

class LocalizationService extends Translations {
  // Define the fallback locale.
  static final fallbackLocale = Locale('bn', 'BD');

  // Get the device locale or fallback to the default locale.
  static final locale = fallbackLocale;

  // Define the translations for each language.
  @override
  Map<String, Map<String, String>> get keys => {
        'en': enUs,
        'bn': BD,
      };

  // Initialize the localization service.
  Future<LocalizationService> init() async {
    // Get the selected language from storage.
    final storage = GetStorage();
    final selectedLanguage = storage.read('language');

    // Set the locale based on the selected language, or fallback to the device locale or default locale.
    final locale =
        Locale(selectedLanguage ?? LocalizationService.locale.languageCode);
    // Update the locale.
    await Get.updateLocale(locale);

    // Return the initialized localization service.
    return this;
  }
}
