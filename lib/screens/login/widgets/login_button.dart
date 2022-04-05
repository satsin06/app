import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/auth_provider.dart';
import '../providers/login_agreement_provider.dart';
import '../providers/login_message_provider.dart';
import '../providers/login_mode_provider.dart';
import '../providers/login_sending_provider.dart';
import '../providers/login_text_editing_controller_provider.dart';

class LoginButton extends ConsumerWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool useOTP = ref.watch(hasLoginModeProvider(LoginMode.otp));
    final bool isSending = ref.watch(loginSendingProvider);

    final Widget child = isSending
        ? const SizedBox.square(
            dimension: 24,
            child: CircularProgressIndicator.adaptive(),
          )
        : Text(
            useOTP ? '注册/登录' : '登录',
            style: const TextStyle(
              fontSize: 16,
            ),
          );

    return ElevatedButton(
      onPressed: isSending ? null : _createOnPressedHandler(context, ref),
      child: child,
      style: ButtonStyle(
        padding:
            MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 14)),
        shape: MaterialStateProperty.all(const StadiumBorder()),
      ),
    );
  }

  VoidCallback _createOnPressedHandler(BuildContext context, WidgetRef ref) {
    return () {
      // Unfocus, hidden keyboard
      FocusScope.of(context).unfocus();

      // Validate form, if validated, send login request.
      if (_validate(ref)) {
        _createAccessToken(context, ref);
      }
    };
  }

  String _accountWrapper(String value) {
    if (value.length == 11 && value.startsWith('1')) {
      return '+86$value';
    }

    return value;
  }

  void _createAccessToken(BuildContext context, WidgetRef ref) async {
    // Set sending state
    ref.read(loginSendingProvider.state).state = true;

    // Get auth notifier.
    final AuthNotifier authNotifier = ref.read(authProvider);

    try {
      final account =
          ref.watch(loginAccountTextEditingControllerProvider).text.trim();
      final password =
          ref.watch(loginPasswordTextEditingControllerProvider).text;
      final isOtpMode = ref.read(hasLoginModeProvider(LoginMode.otp));

      await authNotifier.login(
        account: _accountWrapper(account),
        password: password,
        usePhoneOtp: isOtpMode,
      );
    } catch (e) {
      print(e);
      if (e is FormatException) {
        ref.read(loginPasswordMessageProvider.state).state = e.message;
      } else {
        ref.read(loginPasswordMessageProvider.state).state = '登录失败，未知错误';
      }
    } finally {
      // Set sending state
      ref.read(loginSendingProvider.state).state = false;
    }
  }

  bool _validate(WidgetRef ref) {
    return _validateAccount(ref) &&
        _validatePassword(ref) &&
        _validateAgreement(ref);
  }

  bool _validateAgreement(WidgetRef ref) {
    final bool hasAgreement = ref.watch(loginAgreementProvider);
    if (!hasAgreement) {
      ref.read(loginPasswordMessageProvider.state).state = '请同意用户协议';
    }

    return hasAgreement;
  }

  bool _validatePassword(WidgetRef ref) {
    final String? password =
        ref.read(loginPasswordTextEditingControllerProvider).text;
    final isOtpMode = ref.read(hasLoginModeProvider(LoginMode.otp));

    // Validate password empty
    if (password == null || password.isEmpty) {
      ref.read(loginPasswordMessageProvider.state).state =
          isOtpMode ? '请输入验证码' : '请输入密码';
      return false;
    }

    // Clear error message
    ref.read(loginPasswordMessageProvider.state).state = null;

    return true;
  }

  bool _validateAccount(WidgetRef ref) {
    final account =
        ref.read(loginAccountTextEditingControllerProvider).text.trim();
    final isOtpMode = ref.read(hasLoginModeProvider(LoginMode.otp));

    // Validate account is empty
    if (account.isEmpty) {
      ref.read(loginAccountMessageProvider.state).state =
          isOtpMode ? '请输入手机号码' : '请输入账号';
      return false;
    }

    // Validate account is not china phone number
    if (isOtpMode && (account.length != 11 || !account.startsWith('1'))) {
      ref.read(loginAccountMessageProvider.state).state = '请输入正确的手机号';
      return false;
    }

    // Clear error message
    ref.read(loginAccountMessageProvider.state).state = null;

    return true;
  }
}
