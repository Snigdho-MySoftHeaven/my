import 'package:get/get.dart';

import 'package:vumi/app/modules/calculation/bindings/calculation_binding.dart';
import 'package:vumi/app/modules/calculation/views/calculation_view.dart';
import 'package:vumi/app/modules/dolil_registration/bindings/dolil_registration_binding.dart';
import 'package:vumi/app/modules/dolil_registration/views/dolil_registration_view.dart';
import 'package:vumi/app/modules/extra/bindings/extra_binding.dart';
import 'package:vumi/app/modules/extra/views/extra_view.dart';
import 'package:vumi/app/modules/home/bindings/home_binding.dart';
import 'package:vumi/app/modules/home/views/home_view.dart';
import 'package:vumi/app/modules/units/bindings/units_binding.dart';
import 'package:vumi/app/modules/units/views/units_view.dart';
import 'package:vumi/app/modules/wordmeaning/bindings/wordmeaning_binding.dart';
import 'package:vumi/app/modules/wordmeaning/views/wordmeaning_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

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
  ];
}
