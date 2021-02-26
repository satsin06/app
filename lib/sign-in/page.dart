import 'package:get/get.dart';

import 'binding.dart';
import 'view.dart';

GetPage signInPage = GetPage(
  name: 'sign',
  page: () => SignInView(),
  binding: SignInBinding(),
);
