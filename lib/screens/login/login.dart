import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/unfocus.dart';
import 'login_state.dart';
import 'widgets/forget_password.dart';
import 'widgets/login_account_input.dart';
import 'widgets/login_agreement.dart';
import 'widgets/login_button.dart';
import 'widgets/login_logo.dart';
import 'widgets/login_password_input.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UnfocusWidget(
      child: ChangeNotifierProvider(
        create: (BuildContext context) => LoginState(),
        child: const _LoginScaffold(),
      ),
    );
  }
}

class _LoginScaffold extends StatelessWidget {
  const _LoginScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool useOTP =
        context.select<LoginState, bool>((LoginState state) => state.useOTP);

    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          actions: [
            TextButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                context.read<LoginState>().toggleUseOTP();
              },
              child: Text(useOTP ? '使用账号密码登录' : '使用验证码快捷登录注册'),
            )
          ],
        ),
        body: const _StatedListView(),
      ),
      onWillPop: () async {
        return context.read<LoginState>().hasLogging == false;
      },
    );
  }
}

class _StatedListView extends StatelessWidget {
  const _StatedListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final useOTP = context.select<LoginState, bool>((state) => state.useOTP);
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        const LoginLogoWidget(),
        const SizedBox(height: 60),
        const LoginAccountInputWidget(),
        const SizedBox(height: 20),
        const LoginPasswordInputWidget(),
        const SizedBox(height: 20),
        const LoginButton(),
        useOTP ? const SizedBox(height: 20) : const LoginForgetPasswordWidget(),
        const LoginAgreementWidget(),
      ],
    );
  }
}
