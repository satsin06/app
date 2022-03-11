import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/unfocus.dart';
import 'login_state.dart';
import 'widgets/forget_password.dart';
import 'widgets/login_account_input.dart';
import 'widgets/login_agreement.dart';
import 'widgets/login_logo.dart';
import 'widgets/phone_otp_input.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UnfocusWidget(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
        ),
        body: ChangeNotifierProvider(
          create: (context) => LoginState(),
          child: const _StatedListView(),
          lazy: true,
        ),
      ),
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
        const LoginPhoneOTPInputWidget(),
        useOTP ? const SizedBox(height: 20) : const LoginForgetPasswordWidget(),
        const LoginAgreementWidget(),
      ],
    );
  }
}
