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
    final bool isOtp = ref.watch(loginModeProvider) == LoginMode.otp;

    // Build the [TextField] enabled state.
    final bool enabled = !ref.watch(loginSendingProvider);

    // Account input error message.
    final String? errorMessage = ref.watch(loginAccountMessageProvider);

    return TextField(
      controller: ref.watch(loginAccountTextEditingControllerProvider),
      enabled: enabled,
      keyboardType: isOtp ? TextInputType.phone : TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: isOtp ? '手机号码' : 'E-Mail/手机号码/用户名',
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
        LengthLimitingTextInputFormatter(isOtp ? 18 : 32),
        isOtp
            ? FilteringTextInputFormatter.allow(RegExp(r'[0-9\-\+]'))
            : FilteringTextInputFormatter.allow(RegExp(r'[a-z0-9@._]')),
      ],
    );
  }
}
