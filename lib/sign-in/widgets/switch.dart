import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller.dart';

class SignInSwitchMode extends GetView<SignInController> {
  const SignInSwitchMode({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        switchButton,
        forgotPasswordButton,
      ],
    );
  }

  Widget get forgotPasswordButton =>
      Obx(() => controller.mode.value == SignInMode.PASSWORD
          ? TextButton(
              // TODO: Add route to forgot password
              onPressed: null,
              child: Text(
                'FORGOT_PASSWORD'.tr,
              ),
            )
          : const SizedBox.shrink());

  Widget get switchButton => TextButton(
      onPressed: onSwitchMode,
      child: Obx(() => Text(
            controller.mode.value == SignInMode.PASSWORD
                ? 'SIGN_IN_USE_SMS_CODE'.tr
                : 'SIGN_IN_USE_PASSWORD'.tr,
            style: TextStyle(color: Get.context.theme.primaryColor),
          )));

  void onSwitchMode() {
    Get.focusScope.unfocus();
    controller.switchMode(controller.mode.value == SignInMode.PASSWORD
        ? SignInMode.SMS_CODE
        : SignInMode.PASSWORD);
  }
}
