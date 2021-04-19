import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller.dart';
import 'get-security-code-button.dart';

class SignInSecurity extends GetView<SignInController> {
  const SignInSecurity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24),
      child: Obx(() => TextField(
            controller: controller.securityController,
            keyboardType: keyboardType,
            textInputAction: TextInputAction.done,
            obscureText: controller.mode.value == SignInMode.PASSWORD,
            autofocus: false,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              labelText: labelText,
              suffixIcon: suffixIcon,
            ),
            // onChanged: _createCodeChangedHandler(context),
          )),
    );
  }

  TextInputType get keyboardType => controller.mode.value == SignInMode.PASSWORD
      ? TextInputType.visiblePassword
      : TextInputType.number;

  Widget? get suffixIcon => controller.mode.value == SignInMode.SMS_CODE
      ? const SignInGetSecurityCodeButton()
      : null;

  String? get labelText => controller.mode.value == SignInMode.PASSWORD
      ? 'INPUT_ENTER'.trParams({
          'field': 'PASSWORD'.tr,
        })
      : 'SMS_CODE'.tr;
}
