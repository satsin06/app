import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../api/api.dart';
import '../../../../widgets/card_wrapper.dart';
import '../../../../widgets/send_ont_time_password_binder.dart';
import 'account_security_health_fetch_card.dart';

final AutoDisposeStateProvider<UserSecurityFields?> $VerificationFieldProvider =
    StateProvider.autoDispose<UserSecurityFields?>((ref) => null);
final AutoDisposeChangeNotifierProvider<TextEditingController>
    $VerificationValueControllerProvider =
    ChangeNotifierProvider.autoDispose<TextEditingController>(
  (ref) => TextEditingController(),
);

class AccountSecurityVerificationCard extends ConsumerWidget {
  const AccountSecurityVerificationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _VerificationCardTitle(),
        AccountSecurityHealthFetchCard(
          child: CardWrapper(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: const [
                _SelectVerificationField(),
                _SwitchVerificationChildren(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _SwitchVerificationChildren extends ConsumerWidget {
  const _SwitchVerificationChildren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final field = ref.watch($VerificationFieldProvider);
    if (field == null) return const SizedBox.shrink();

    final String hintText =
        field == UserSecurityFields.password ? '请输入密码' : '请输入验证码';
    Widget? sendOneTimePasswordButton;
    if (field != UserSecurityFields.password) {
      sendOneTimePasswordButton = SendOntTimePasswordBinder.forAuth(
        phone: field == UserSecurityFields.phone,
        email: field == UserSecurityFields.email,
        errorNotifier: _createErrorNotifier(ref),
      );
    }

    return TextField(
      controller: ref.watch($VerificationValueControllerProvider),
      keyboardType: field == UserSecurityFields.password
          ? TextInputType.visiblePassword
          : TextInputType.text,
      obscureText: field == UserSecurityFields.password,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(borderSide: BorderSide.none),
        contentPadding: const EdgeInsets.symmetric(horizontal: 0),
        suffixIcon: sendOneTimePasswordButton,
      ),
      inputFormatters: [
        /// Only allow not empty string
        FilteringTextInputFormatter.allow(RegExp(r'\S')),
      ],
    );
  }

  SendOntTimePasswordErrorNotifier _createErrorNotifier(WidgetRef ref) {
    return (BuildContext context, Object error, [StackTrace? stackTrace]) {
      final String message =
          error is FormatException ? error.message : error.toString();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 3),
        ),
      );
    };
  }
}

class _SelectVerificationField extends ConsumerWidget {
  const _SelectVerificationField({Key? key}) : super(key: key);

  get messageMap => {
        UserSecurityFields.email: '使用邮件验证',
        UserSecurityFields.phone: '使用短信验证',
        UserSecurityFields.password: '使用密码验证',
      };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final healths = ref.watch($AccountSecurityHealthProvider);
    final healthsWithoutFalse = healths.where((element) => element.status);
    final field = ref.watch($VerificationFieldProvider);

    return DropdownButton<UserSecurityFields>(
      value: field,
      isExpanded: true,
      underline: const SizedBox.shrink(),
      hint: const Text('请选择验证方式'),
      items: healthsWithoutFalse
          .map<DropdownMenuItem<UserSecurityFields>>(
            (element) => DropdownMenuItem<UserSecurityFields>(
              value: element.field,
              child: Text(element.message ?? messageMap[element.field]),
            ),
          )
          .toList(),
      onChanged: (field) {
        ref.read($VerificationFieldProvider.notifier).update((state) => field);
        ref.read($VerificationValueControllerProvider).clear();
      },
    );
  }
}

class _VerificationCardTitle extends StatelessWidget {
  const _VerificationCardTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Text(
        '验证',
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
