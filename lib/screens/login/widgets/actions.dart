import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../logic.dart';
import '../state.dart';
import '../../../graphql/schema.dart';

class LoginActions extends GetView<LoginLogic> {
  const LoginActions({Key? key}) : super(key: key);

  LoginState get state => controller.state;

  bool get showForgotPassword =>
      state.mode.value == GUserSecurityCompareType.PASSWORD;

  String get switchLoginModeText => showForgotPassword
      ? 'SIGN_IN_USE_SMS_CODE'.tr
      : 'SIGN_IN_USE_PASSWORD'.tr;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(() => TextButton(
            onPressed: state.signing.value ? null : controller.switchModeHandler,
            child: Text(switchLoginModeText))),
        Obx(() => showForgotPassword
            ? TextButton(onPressed: null, child: Text('FORGOT_PASSWORD'.tr))
            : const SizedBox.shrink()),
      ],
    );
  }
}
