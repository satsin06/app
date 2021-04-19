import 'package:get/get.dart';

import 'bindings.dart';
import 'view.dart';

GetPage $LoginPage = GetPage(
  name: 'login',
  page: () => LoginView(),
  binding: LoginBindings(),
);
