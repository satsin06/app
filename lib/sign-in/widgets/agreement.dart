import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller.dart';

class SignInAgreement extends GetView<SignInController> {
  const SignInAgreement({Key key}) : super(key: key);

  TextStyle get agreementStyle => TextStyle(
        color: Get.theme.primaryColor,
      );

  String get prefix => 'AGREE'.tr;
  String get userAgreement => 'USER_AGREEMENT'.tr;
  String get privacyPolicy => 'PRIVACY_POLICY'.tr;
  String get and => '&'.tr;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => Checkbox(
              value: controller.agreement.value,
              onChanged: controller.changeAgreement,
              splashRadius: 24.0,
            ),
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: prefix),
                TextSpan(
                  text: userAgreement,
                  style: agreementStyle,
                ),
                TextSpan(text: and),
                TextSpan(
                  text: privacyPolicy,
                  style: agreementStyle,
                )
              ],
            ),
            overflow: TextOverflow.visible,
            textAlign: TextAlign.center,
            style: context.textTheme.caption,
          ),
        ],
      ),
    );
  }
}
