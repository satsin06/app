import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../logic.dart';

class LoginAgreement extends GetView<LoginLogic> {
  const LoginAgreement({Key? key}) : super(key: key);

  String get prefix => 'AGREE'.tr;
  String get userAgreement => 'USER_AGREEMENT'.tr;
  String get privacyPolicy => 'PRIVACY_POLICY'.tr;
  String get and => '&'.tr;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => Checkbox(
              value: controller.state.agreement.value,
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
                  style: TextStyle(
                    color: context.theme.primaryColor,
                  ),
                ),
                TextSpan(text: and),
                TextSpan(
                  text: privacyPolicy,
                  style: TextStyle(
                    color: context.theme.primaryColor,
                  ),
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
