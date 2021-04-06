import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Translations;

import 'pages.dart';
import 'theme.dart';
import 'translations/translations.dart';

void main() {
  runApp(Socfony());
}

class Socfony extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: Get.deviceLocale,
      fallbackLocale: Locale('zh', 'CN'),
      translations: Translations(),
      onGenerateTitle: (BuildContext context) => 'APP_NAME'.tr,
      getPages: pages,
      initialRoute: initialRoute,
      themeMode: ThemeMode.system,
      theme: SocfonyTheme.light(),
      darkTheme: SocfonyTheme.dark(),
    );
  }
}
