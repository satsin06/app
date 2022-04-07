import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

class _SendOTPButton extends ConsumerStatefulWidget {
  const _SendOTPButton({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<_SendOTPButton> createState() => _SendOTPButtonState();
}

class _SendOTPButtonState extends ConsumerState<_SendOTPButton> {
  Timer? _timer;
  final int _countdown = 60;
  int _currentCountdown = 0;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Widget get child {
    if (ref.watch(loginOtpProvider).hasSending) {
      return const SizedBox.square(
        child: CircularProgressIndicator(strokeWidth: 2.0),
        dimension: 20.0,
      );
    }

    return Text(_currentCountdown == 0 ? '获取验证码' : '$_currentCountdown s');
  }

  @override
  Widget build(BuildContext context) {
    // TextButton onPressed
    void Function()? onPressed = _currentCountdown == 0 ? onSendOTP : null;

    // Has OTP is sending
    final bool hasOTPIsSending = ref.watch(loginOtpProvider).hasSending;

    // If account is not China phone number, disable button
    if (hasOTPIsSending) {
      onPressed = null;
    }

    return TextButton(
      onPressed: onPressed,
      child: child,
    );
  }

  void onSendOTP() async {
    final account = ref.read(loginAccountTextEditingControllerProvider).text;
    if (account.length != 11 || !account.startsWith('1')) {
      ref.read(loginAccountMessageProvider.state).state = '请输入正确的手机号';
      return;
    }

    _timer?.cancel();
    ref.read(loginAccountMessageProvider.state).state = null;
    ref.read(loginPasswordMessageProvider.state).state = null;
    final sent = await ref.read(loginOtpProvider).send(account);
    if (sent) {
      setState(() {
        _currentCountdown = _countdown;
      });
      _timer = Timer.periodic(
        const Duration(seconds: 1),
        (Timer timer) {
          setState(() {
            _currentCountdown--;
            if (_currentCountdown == 0) {
              timer.cancel();
            }
          });
        },
      );
    }
  }
}
