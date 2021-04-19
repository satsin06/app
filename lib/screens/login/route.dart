import 'package:get/get.dart';

import 'bindings.dart';
import 'view.dart';

GetPage $LoginPage = GetPage(
  name: 'login',
  page: () => const LoginView(),
  binding: LoginBindings(),
);
