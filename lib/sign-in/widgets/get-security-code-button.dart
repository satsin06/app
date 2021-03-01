import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller.dart';

class SignInGetSecurityCodeButton extends GetView<SignInController> {
  const SignInGetSecurityCodeButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Obx(() => GestureDetector(
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 24.0),
                child: Text(
                  'GET_SMS_CODE'.tr,
                  style: TextStyle(
                    color: allowTap
                        ? Get.theme.primaryColor
                        : Get.theme.primaryColor.withOpacity(0.6),
                  ),
                ),
              ),
            ),
            onTap: allowTap ? onSendCode : null,
          )),
    );
  }

  void onSendCode() {
    print(111);
  }

  bool get allowTap => controller.account.value.isPhoneNumber;
}
