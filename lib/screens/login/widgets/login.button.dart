import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../logic.dart';
import '../state.dart';

class LoginButton extends GetView<LoginLogic> {
  const LoginButton({Key? key}) : super(key: key);

  LoginState get state => controller.state;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 36.0),
      child: SizedBox(
        width: 200.0,
        height: 44.0,
        child: Obx(() => ElevatedButton(
          onPressed: state.signing.value ? null : controller.loginHandler,
          child: Text(state.signing.value ? '登录中...' : 'SIGN_IN'.tr),
        )),
      ),
    );
  }
}
