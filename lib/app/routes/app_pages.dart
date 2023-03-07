import 'package:get/get.dart';

import 'package:vumi/app/modules/calculation/bindings/calculation_binding.dart';
import 'package:vumi/app/modules/calculation/views/calculation_view.dart';
import 'package:vumi/app/modules/dolil_registration/bindings/dolil_registration_binding.dart';
import 'package:vumi/app/modules/dolil_registration/views/dolil_registration_view.dart';
import 'package:vumi/app/modules/extra/bindings/extra_binding.dart';
import 'package:vumi/app/modules/extra/views/extra_view.dart';
import 'package:vumi/app/modules/home/bindings/home_binding.dart';
import 'package:vumi/app/modules/home/views/home_view.dart';
import 'package:vumi/app/modules/qrcoode/bindings/qrcoode_binding.dart';
import 'package:vumi/app/modules/qrcoode/views/qrcoode_view.dart';
import 'package:vumi/app/modules/settings/bindings/settings_binding.dart';
import 'package:vumi/app/modules/settings/views/settings_view.dart';
import 'package:vumi/app/modules/units/bindings/units_binding.dart';
import 'package:vumi/app/modules/units/views/units_view.dart';
import 'package:vumi/app/modules/webView/bindings/web_view_binding.dart';
import 'package:vumi/app/modules/webView/views/web_view_view.dart';
import 'package:vumi/app/modules/wordmeaning/bindings/wordmeaning_binding.dart';
import 'package:vumi/app/modules/wordmeaning/views/wordmeaning_view.dart';

import '../../screens/bottom_navbar/bottom_nav_bar.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();


  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DOLIL_REGISTRATION,
      page: () => DolilRegistrationView(),
      binding: DolilRegistrationBinding(),
    ),
    GetPage(
      name: _Paths.EXTRA,
      page: () => ExtraView(),
      binding: ExtraBinding(),
    ),
    GetPage(
      name: _Paths.UNITS,
      page: () => UnitsView(),
      binding: UnitsBinding(),
    ),
    GetPage(
      name: _Paths.WORDMEANING,
      page: () => WordmeaningView(),
      binding: WordmeaningBinding(),
    ),
    GetPage(
      name: _Paths.CALCULATION,
      page: () => CalculationView(),
      binding: CalculationBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.QRCOODE,
      page: () => QrcoodeView(),
      binding: QrcoodeBinding(),
    ),
    GetPage(
      name: _Paths.WEB_VIEW,
      page: () => WebViewView(),
      binding: WebViewBinding(),
    ),
  ];
}
