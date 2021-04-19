import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Translations;
import 'package:socfony/test.dart';

import 'pages/pages.dart';
import 'theme.dart';
import 'translations/translations.dart';

void main() {
  demo();
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
      themeMode: ThemeMode.light,
      theme: SocfonyTheme.light(),
      darkTheme: SocfonyTheme.dark(),
    );
  }
}
