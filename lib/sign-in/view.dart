import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'widgets/account.dart';
import 'widgets/agreement.dart';
import 'widgets/security.dart';
import 'widgets/sign-in-button.dart';
import 'widgets/switch.dart';

class SignInView extends GetView<SignInController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: context.theme.scaffoldBackgroundColor,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 24.0, right: 24.0),
        width: context.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'APP_NAME'.tr,
              style: context.textTheme.headline2!.copyWith(
                color: context.theme.primaryColor,
              ),
            ),
            const SignInAccountInput(),
            const SignInSecurity(),
            const SignInSwitchMode(),
            const SignInButton(),
            const SignInAgreement(),
          ],
        ),
      ),
    );
  }
}
