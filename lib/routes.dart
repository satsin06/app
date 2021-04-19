import 'package:get/get.dart';

import 'screens/login/route.dart';

class Routes {
  const Routes._();

  static String initialRoute = $LoginPage.name;
  static List<GetPage> getPages = [
    $LoginPage,
  ];
}
