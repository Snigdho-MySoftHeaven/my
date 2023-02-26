import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocalizationService extends Translations {
  // Define the fallback locale.
  static final fallbackLocale = Locale('bn', 'BD');

  // Get the device locale or fallback to the default locale.
  static final locale = Get.deviceLocale ?? fallbackLocale;

  // Define the translations for each language.
  @override
  Map<String, Map<String, String>> get keys => {
        'en': enUs,
        'bn': BD,
      };

  final enUs = {
    'title': 'Home',
    'settings': 'Settings',
    '0': '0',
    '1': '1',
    '2': '2',
    '3': '3',
    '4': '4',
    '5': '5',
    '6': '6',
    '7': '7',
    '8': '8',
    '9': '9',
  };

  final BD = {
    'title': 'হোম পেজ',
    'settings': 'সেটিংস',
    '0': '০',
    '1': '১',
    '2': '২',
    '3': '৩',
    '4': '৪',
    '5': '৫',
    '6': '৬',
    '7': '৭',
    '8': '৮',
    '9': '৯',
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
