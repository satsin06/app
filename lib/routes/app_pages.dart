import 'package:get/route_manager.dart';

import 'app_routes.dart';
import '../screens/home/home.screen.dart';

abstract class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
    ),
  ];
}
