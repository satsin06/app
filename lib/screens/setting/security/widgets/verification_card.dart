import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../api/api.dart';
import '../../../../widgets/card_wrapper.dart';
import '../../../../widgets/send_ont_time_password_binder.dart';
import 'account_security_health_fetch_card.dart';

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

final AutoDisposeStateProvider<UserSecurityFields?>
    $VerificationMethodProvider =
    StateProvider.autoDispose<UserSecurityFields?>((ref) => null);
final AutoDisposeChangeNotifierProvider<TextEditingController>
    $VerificationValueControllerProvider =
    ChangeNotifierProvider.autoDispose<TextEditingController>(
  (ref) => TextEditingController(),
);

class VerificationCard extends ConsumerWidget {
  const VerificationCard({Key? key}) : super(key: key);

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
                _SelectVerificationMethod(),
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
    final method = ref.watch($VerificationMethodProvider);
    if (method == null) return const SizedBox.shrink();

    final String hintText =
        method == UserSecurityFields.password ? '请输入原密码' : '请输入验证码';
    Widget? sendOneTimePasswordButton;
    if (method != UserSecurityFields.password) {
      sendOneTimePasswordButton = SendOntTimePasswordBinder.forAuth(
        phone: method == UserSecurityFields.phone,
        email: method == UserSecurityFields.email,
      );
    }

    return TextField(
      controller: ref.watch($VerificationValueControllerProvider),
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(borderSide: BorderSide.none),
        contentPadding: const EdgeInsets.symmetric(horizontal: 0),
        suffixIcon: sendOneTimePasswordButton,
      ),
    );
  }
}

class _SelectVerificationMethod extends ConsumerWidget {
  const _SelectVerificationMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final healths = ref.watch($AccountSecurityHealthProvider);
    final healthsWithoutFalse = healths.where((element) => element.status);
    final method = ref.watch($VerificationMethodProvider);

    return DropdownButton<UserSecurityFields>(
      value: method,
      isExpanded: true,
      underline: const SizedBox.shrink(),
      hint: const Text('请选择验证方式'),
      items: healthsWithoutFalse
          .map<DropdownMenuItem<UserSecurityFields>>((element) {
        switch (element.field) {
          case UserSecurityFields.email:
            return DropdownMenuItem<UserSecurityFields>(
              value: element.field,
              child: Text(element.message ?? '邮箱验证'),
            );
          case UserSecurityFields.phone:
            return DropdownMenuItem<UserSecurityFields>(
              value: element.field,
              child: Text(element.message ?? '手机验证'),
            );
          case UserSecurityFields.password:
            return DropdownMenuItem<UserSecurityFields>(
              value: element.field,
              child: const Text('密码验证'),
            );
        }
      }).toList(),
      onChanged: (field) {
        ref.read($VerificationMethodProvider.notifier).update((state) => field);
      },
    );
  }
}
