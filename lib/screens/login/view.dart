import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'widgets/account.input.dart';
import 'widgets/actions.dart';
import 'widgets/agreement.dart';
import 'widgets/login.button.dart';
import 'widgets/security.input.dart';

class LoginView extends GetView<LoginLogic> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: context.theme.scaffoldBackgroundColor,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        width: context.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'APP_NAME'.tr,
              style: context.textTheme.headline2!.copyWith(
                color: context.theme.primaryColor,
              ),
            ),
            const LoginAccountInput(),
            const LoginSecurityInput(),
            const LoginActions(),
            const LoginButton(),
            const LoginAgreement(),
          ],
        ),
      ),
    );
  }
}
