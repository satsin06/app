import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInAgreement extends StatelessWidget {
  const SignInAgreement({Key key}) : super(key: key);

  TextStyle get agreementStyle => TextStyle(
        color: Get.theme.primaryColor,
      );

  String get prefix => 'SIGN_AGREEMENT_PREFIX'.tr;
  String get userAgreement => 'USER_AGREEMENT'.tr;
  String get privacyPolicy => 'PRIVACY_POLICY'.tr;
  String get and => '&'.tr;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
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
    );
  }
}
