import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart' hide Translations;

import 'routes.dart';
import 'theme.dart';
import 'translations/translations.dart';

class AppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('zh', 'CN'),
      supportedLocales: [
        const Locale('zh', 'CN'),
      ],
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      translations: Translations(),
      onGenerateTitle: (BuildContext context) => 'APP_NAME'.tr,
      getPages: Routes.getPages,
      initialRoute: Routes.initialRoute,
      themeMode: ThemeMode.light,
      theme: SocfonyTheme.light(),
      darkTheme: SocfonyTheme.dark(),
    );
  }
}
