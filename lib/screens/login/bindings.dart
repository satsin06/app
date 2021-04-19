import 'package:get/get.dart';
import 'package:socfony/screens/login/logic.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginLogic>(() => LoginLogic());
  }
}
