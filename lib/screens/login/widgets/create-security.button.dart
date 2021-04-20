import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../logic.dart';
import '../state.dart';
import '../../../graphql/schema.dart';

class LoginCreateSecurityButton extends GetView<LoginLogic> {
  LoginState get state => controller.state;

  bool get allowCreateSecurity =>
      state.createSecurityStatus.value == LoginCreateSecurityStatus.AWAIT &&
      state.account.value.isPhoneNumber;

  @override
  Widget build(BuildContext context) {
    return Obx(() => state.mode.value == GUserSecurityCompareType.PHONE_SMS_CODE
        ? TextButton(
            child: Text(state.createSecurityStatus.value ==
                    LoginCreateSecurityStatus.AWAIT
                ? 'GET_SMS_CODE'.tr
                : state.createSecurityStatus.value ==
                        LoginCreateSecurityStatus.INPROGRESS
                    ? '获取中...'
                    : '${60 - state.countdownNumber.value}s'),
            // child: Text(controller.countdownTimer == null ? 'GET_SMS_CODE'.tr : '${60 - state.countdownNumber.value}s'),
            onPressed:
                allowCreateSecurity ? controller.createSecurityHandler : null,
          )
        : const SizedBox.shrink());
  }
}
