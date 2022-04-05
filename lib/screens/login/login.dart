import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/dynamic_app_bar.dart';
import '../../widgets/unfocus.dart';
import 'providers/login_mode_provider.dart';
import 'providers/login_text_editing_controller_provider.dart';
import 'widgets/forget_password.dart';
import 'widgets/login_account_input.dart';
import 'widgets/login_agreement.dart';
import 'widgets/login_button.dart';
import 'widgets/login_logo.dart';
import 'widgets/login_password_input.dart';

List<Widget> _actionsBuilder(BuildContext context, double opacity) {
  return const [_ToggleLoginModeButton()];
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const UnfocusWidget(
      child: Scaffold(
        appBar: DynamicAppBar(
          automaticallyImplyLeading: true,
          actions: _actionsBuilder,
        ),
        body: _StatedListView(),
      ),
    );
  }
}

class _ToggleLoginModeButton extends ConsumerWidget {
  const _ToggleLoginModeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isOtp = ref.watch(hasLoginModeProvider(LoginMode.otp));

    return TextButton(
      onPressed: _createToggleModeHandler(context, ref),
      child: Text(isOtp ? '使用账号密码登录' : '使用验证码快捷登录注册'),
    );
  }

  VoidCallback _createToggleModeHandler(BuildContext context, WidgetRef ref) {
    return () {
      // Unfocus the input fields.
      FocusScope.of(context).unfocus();

      // Toggle the login mode.
      ref.read(loginModeProvider.notifier).update((state) {
        // If state is password, Check account is phone number, if it's not,
        // clear account input.
        if (state == LoginMode.password) {
          final TextEditingController controller =
              ref.read(loginAccountTextEditingControllerProvider);
          final String account = controller.text.trim();
          if (account.length != 11 || !account.startsWith('1')) {
            ref.read(loginAccountTextEditingControllerProvider).clear();
          }
        }

        // Toggle the login mode.
        return state == LoginMode.otp ? LoginMode.password : LoginMode.otp;
      });

      // Clear the password input.
      ref.read(loginPasswordTextEditingControllerProvider).clear();
    };
  }
}

class _StatedListView extends ConsumerWidget {
  const _StatedListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isOtp = ref.watch(hasLoginModeProvider(LoginMode.otp));
    final Widget widget =
        isOtp ? const SizedBox(height: 20) : const LoginForgetPasswordWidget();

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
        widget,
        const LoginAgreementWidget(),
      ],
    );
  }
}
