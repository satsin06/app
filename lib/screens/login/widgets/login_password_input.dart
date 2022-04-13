import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../widgets/send_ont_time_password_binder.dart';
import '../providers/login_message_provider.dart';
import '../providers/login_mode_provider.dart';
import '../providers/login_sending_provider.dart';
import '../providers/login_text_editing_controller_provider.dart';

final _showPasswordProvider = StateProvider.autoDispose((ref) => false);

class LoginPasswordInputWidget extends ConsumerWidget {
  const LoginPasswordInputWidget({Key? key}) : super(key: key);

  VoidCallback _onPasswordVisibleToggle(WidgetRef ref) => () {
        final bool visible = ref.read(_showPasswordProvider);
        ref.read(_showPasswordProvider.state).state = !visible;
      };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? errorMessage = ref.watch(loginPasswordMessageProvider);
    final bool useOTP = ref.watch(loginModeProvider) == LoginMode.otp;
    final bool showPassword = ref.watch(_showPasswordProvider);
    final Widget suffixIcon = useOTP
        ? const Padding(
            padding: EdgeInsets.only(right: 12),
            child: _SendOTPButton(),
          )
        : IconButton(
            onPressed: _onPasswordVisibleToggle(ref),
            icon: Icon(showPassword ? Icons.visibility : Icons.visibility_off),
          );

    return TextField(
      controller: ref.watch(loginPasswordTextEditingControllerProvider),
      keyboardType: TextInputType.visiblePassword,
      obscureText: useOTP ? false : !showPassword,
      decoration: InputDecoration(
        hintText: useOTP ? '验证码' : '请输入密码',
        errorText: errorMessage,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide.none,
        ),
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}

class _SendOTPButton extends ConsumerWidget {
  const _SendOTPButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String account =
        ref.watch(loginAccountTextEditingControllerProvider).text.trim();

    return SendOntTimePasswordBinder.forTarget(
      phone: account,
      errorNotifier: _createErrorNotifier(ref),
      builder: _createBuilder(ref, account),
    );
  }

  SendOntTimePasswordWidgetBuilder _createBuilder(
      WidgetRef ref, String account) {
    return (
      BuildContext context, {
      required bool sending,
      required int seconds,
      VoidCallback? onPressed,
    }) {
      if (account.isEmpty && seconds == 0 && sending == false) {
        return const TextButton(
          onPressed: null,
          child: Text('获取验证码'),
        );
      }

      return defaultSendOneTimePasswordWidgetBuilder(
        context,
        sending: sending,
        seconds: seconds,
        onPressed: () {
          ref.read(loginAccountMessageProvider.state).state = null;
          onPressed?.call();
        },
      );
    };
  }

  SendOntTimePasswordErrorNotifier _createErrorNotifier(WidgetRef ref) {
    return (BuildContext context, Object error, [StackTrace? stackTrace]) {
      ref.read(loginAccountMessageProvider.state).state =
          error is FormatException ? error.message : error.toString();
    };
  }
}
