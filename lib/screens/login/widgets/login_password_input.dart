import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socfony/screens/login/login_state.dart';

import '../graphql/send_phone_otp.mutation.dart';

class LoginPasswordInputWidget extends StatefulWidget {
  const LoginPasswordInputWidget({Key? key}) : super(key: key);

  @override
  State<LoginPasswordInputWidget> createState() =>
      _LoginPasswordInputWidgetState();
}

class _LoginPasswordInputWidgetState extends State<LoginPasswordInputWidget> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    final String? errorMessage =
        context.select((LoginState state) => state.passwordInputErrorMessage);
    final bool useOTP = context.select((LoginState state) => state.useOTP);
    final Widget suffixIcon = useOTP
        ? const Padding(
            padding: EdgeInsets.only(right: 12),
            child: _SendOTPButton(),
          )
        : IconButton(
            onPressed: togglePasswordVisibility,
            icon: Icon(showPassword ? Icons.visibility : Icons.visibility_off));

    return TextField(
      controller: context.read<LoginState>().password,
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

  void togglePasswordVisibility() {
    setState(() {
      showPassword = !showPassword;
    });
  }
}

class _SendOTPButton extends StatefulWidget {
  const _SendOTPButton({
    Key? key,
  }) : super(key: key);

  @override
  State<_SendOTPButton> createState() => _SendOTPButtonState();
}

class _SendOTPButtonState extends State<_SendOTPButton> {
  Timer? _timer;
  final int _countdown = 60;
  int _currentCountdown = 0;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Widget get child {
    if (context.select<LoginState, bool>((value) => value.hasOTPIsSending)) {
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
    final bool hasOTPIsSending = context.select<LoginState, bool>(
      (bloc) => bloc.hasOTPIsSending,
    );

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
    final LoginState state = context.read<LoginState>()
      ..clearAccountInputErrorMessage()
      ..clearPasswordInputErrorMessage();
    if (state.hasOTPIsSending) {
      return;
    } else if (state.account.text.length != 11 ||
        !state.account.text.startsWith('1')) {
      state.setAccountInputErrorMessage('请输入正确的手机号码');
      return;
    }

    _timer?.cancel();
    state.isSendingOTP();
    try {
      await sendPhoneOTP(state.account.text);
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
    } catch (e) {
      state.setPasswordInputErrorMessage(e.toString());
    } finally {
      state.isNotSendingOTP();
    }
  }
}
