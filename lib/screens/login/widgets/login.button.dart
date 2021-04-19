import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../logic.dart';

class LoginButton extends GetView<LoginLogic> {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 36.0),
      child: SizedBox(
        width: 200.0,
        height: 44.0,
        child: ElevatedButton(
          onPressed: controller.loginHandler,
          child: Text('SIGN_IN'.tr),
        ),
      ),
    );
  }
}
