import 'package:get/get.dart';

import 'logic.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginLogic>(() => LoginLogic());
  }
}
