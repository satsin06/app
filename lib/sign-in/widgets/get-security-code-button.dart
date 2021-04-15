import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller.dart';

class SignInGetSecurityCodeButton extends GetView<SignInController> {
  const SignInGetSecurityCodeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextButton(
        onPressed: allowTap ? onSendCode : null,
        child: Text('GET_SMS_CODE'.tr),
      ),
    );
  }

  void onSendCode() {
    print(111);
  }

  bool get allowTap => controller.account.value.isPhoneNumber;
}
