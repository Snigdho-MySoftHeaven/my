import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/Utils/const.dart';
import 'app/Utils/helper_functions.dart';
import 'app/Utils/language.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LicenseRegistry.addLicense(() async* {
    final license =
        await rootBundle.loadString('assets/fonts/Roboto/LICENSE.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  await FlutterDownloader.initialize(
      debug: true // optional: set false to disable printing logs to console
      );
  await initTranslations();
  await GetStorage.init();
  configLoading();
  bn.value = await GetStorage().read('language') != 'bn' ? true : false;

  runApp(
    ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            builder: EasyLoading.init(),
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            translations: LocalizationService(),
            locale: Locale('bn', 'BD'),
            supportedLocales: [
              Locale('en', 'US'),
              Locale('bn', 'BD'),
            ],
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.deepPurple,
                elevation: 0,
              ),
              fontFamily: bn.value ? 'kalpurush' : 'Roboto',
            ),
            title: "Application",
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
          );
        }),
  );
}

Future<void> initTranslations() async {
  await Get.putAsync(() => LocalizationService().init());
}
