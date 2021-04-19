import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../logic.dart';
import '../state.dart';
import '../../../graphql/schema.dart';

class LoginSecurityInput extends GetView<LoginLogic> {
  const LoginSecurityInput({Key? key}) : super(key: key);

  LoginState get state => controller.state;

  String? get labelText => state.mode.value == GUserSecurityCompareType.PASSWORD
      ? 'INPUT_ENTER'.trParams({
          'field': 'PASSWORD'.tr,
        })
      : 'SMS_CODE'.tr;

  TextInputType get keyboardType =>
      state.mode.value == GUserSecurityCompareType.PASSWORD
          ? TextInputType.visiblePassword
          : TextInputType.number;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Obx(() => TextField(
            controller: controller.securityController,
            keyboardType: keyboardType,
            textInputAction: TextInputAction.join,
            decoration: InputDecoration(
              labelText: labelText,
            ),
          )),
    );
  }
}
