import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../login_state.dart';

class LoginAccountInputWidget extends StatelessWidget {
  const LoginAccountInputWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Fetch the [useOTP] value from the [LoginState]
    final bool useOTP = context.select<LoginState, bool>(
      (state) => state.useOTP,
    );

    // Build the [TextField] enabled state.
    bool enabled = context.select<LoginState, bool>(
      (state) => state.hasLogging == false && state.hasOTPIsSending == false,
    );

    return TextField(
      enabled: enabled,
      keyboardType: useOTP ? TextInputType.number : TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: useOTP ? '手机号码' : 'E-Mail/手机号码/用户名',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide.none,
        ),
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
      ),
      onChanged: context.read<LoginState>().updateAccount,
      inputFormatters: [
        LengthLimitingTextInputFormatter(useOTP ? 11 : 32),
        useOTP
            ? FilteringTextInputFormatter.digitsOnly
            : FilteringTextInputFormatter.allow(RegExp(r'[a-z0-9@._]')),
      ],
    );
  }
}
