import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../logic.dart';
import '../state.dart';
import '../../../graphql/schema.dart';

class LoginAccountInput extends GetView<LoginLogic> {
  const LoginAccountInput({Key? key}) : super(key: key);

  LoginState get state => controller.state;

  TextInputType get keyboardType =>
      state.mode.value == GUserSecurityCompareType.PASSWORD
          ? TextInputType.text
          : TextInputType.number;

  String get labelText => state.mode.value == GUserSecurityCompareType.PASSWORD
      ? '${'USERNAME'.tr}/${'PHONE_NUMBER'.tr}'
      : 'PHONE_NUMBER'.tr;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Obx(() => TextField(
            controller: controller.accountController,
            keyboardType: keyboardType,
            textInputAction: TextInputAction.next,
            autofocus: false,
            decoration: InputDecoration(
              labelText: labelText,
            ),
            readOnly: state.signing.value,
          )),
    );
  }
}
