import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../logic.dart';
import '../state.dart';
import '../../../graphql/schema.dart';

class LoginCreateSecurityButton extends GetView<LoginLogic> {
  LoginState get state => controller.state;

  @override
  Widget build(BuildContext context) {
    return Obx(() => state.mode.value == GUserSecurityCompareType.PHONE_SMS_CODE
        ? TextButton(
            child: Text('GET_SMS_CODE'.tr),
            onPressed: null,
          )
        : const SizedBox.shrink());
  }
}
