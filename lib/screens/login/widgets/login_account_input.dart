import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/login_message_provider.dart';
import '../providers/login_mode_provider.dart';
import '../providers/login_sending_provider.dart';
import '../providers/login_text_editing_controller_provider.dart';

class LoginAccountInputWidget extends ConsumerWidget {
  const LoginAccountInputWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Fetch the [useOTP] value from the [LoginState]
    final bool useOTP = ref.watch(hasLoginModeProvider(LoginMode.otp));

    // Build the [TextField] enabled state.
    final bool enabled = !ref.watch(loginSendingProvider);

    // Account input error message.
    final String? errorMessage = ref.watch(loginAccountMessageProvider);

    return TextField(
      controller: ref.read(loginAccountTextEditingControllerProvider),
      enabled: enabled,
      keyboardType: useOTP ? TextInputType.number : TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: useOTP ? '手机号码' : 'E-Mail/手机号码/用户名',
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
      ),
      inputFormatters: [
        LengthLimitingTextInputFormatter(useOTP ? 11 : 32),
        useOTP
            ? FilteringTextInputFormatter.digitsOnly
            : FilteringTextInputFormatter.allow(RegExp(r'[a-z0-9@._]')),
      ],
    );
  }
}
