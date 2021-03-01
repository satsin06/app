import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller.dart';

class SignInAccountInput extends GetView<SignInController> {
  const SignInAccountInput({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24),
      child: Obx(() => TextField(
            controller: controller.accountController,
            keyboardType: keyboardType,
            textInputAction: TextInputAction.next,
            autofocus: false,
            decoration: InputDecoration(
              labelText: labelText,
              contentPadding: EdgeInsets.zero,
            ),
          )),
    );
  }

  TextInputType get keyboardType => controller.mode.value == SignInMode.PASSWORD
      ? TextInputType.text
      : TextInputType.number;

  String get labelText => 'INPUT_ENTER'.trParams({
        'field': controller.mode.value == SignInMode.PASSWORD
            ? '${'USER_LOGIN'.tr}/${'PHONE_NUMBER'.tr}/${'E-MAIL'.tr}'
            : 'PHONE_NUMBER'.tr
      });
}
