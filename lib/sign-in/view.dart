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
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        // title: Text('SIGN_IN'.tr),
        automaticallyImplyLeading: true,
        backgroundColor: context.theme.scaffoldBackgroundColor,
      ),
      body: Container(
        padding: context.mediaQuery.padding.copyWith(left: 24.0, right: 24.0),
        width: context.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'APP_NAME'.tr,
              style: context.textTheme.headline2.copyWith(
                color: context.theme.primaryColor,
              ),
              textAlign: TextAlign.left,
            ),
            Text(
              'SIGN_IN'.tr,
              style: context.textTheme.headline6.copyWith(
                color: context.theme.primaryColor,
              ),
              textAlign: TextAlign.left,
            ),
            const SignInAccountInput(),
            const SignInSecurity(),
            const SignInSwitchMode(),
            const SignInButton(),
            fill,
            const SignInAgreement(),
          ],
        ),
      ),
    );
  }

  Widget get fill => const Expanded(child: const SizedBox.shrink());
}
