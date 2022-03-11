import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socfony/screens/login/login_state.dart';

class LoginPhoneOTPInputWidget extends StatelessWidget {
  const LoginPhoneOTPInputWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: '验证码',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide.none,
        ),
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        suffixIcon: const _SendOTPButton(),
      ),
    );
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
  bool _isSending = false;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Widget get child {
    if (_isSending) {
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

    // Account value
    final String account = context.select<LoginState, String>(
      (bloc) => bloc.account,
    );

    // If account is not China phone number, disable button
    if (account.length != 11 || !account.startsWith('1') || _isSending) {
      onPressed = null;
    }

    return TextButton(
      onPressed: onPressed,
      child: child,
    );
  }

  void onSendOTP() {
    _timer?.cancel();
    setState(() {
      _isSending = true;
    });
  }
}
