import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../api/api.dart';
import '../../../../widgets/card_wrapper.dart';
import '../../../../widgets/send_ont_time_password_binder.dart';
import 'account_security_health_fetch_card.dart';

class VerificationCard extends ConsumerWidget {
  const VerificationCard({Key? key}) : super(key: key);

  static final AutoDisposeStateProvider<UserSecurityFields?>
      $VerificationMethodProvider =
      StateProvider.autoDispose<UserSecurityFields?>((ref) => null);
  static final $VerificationValueProvider =
      Provider.autoDispose<String?>((ref) => null);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final healths = ref.watch($AccountSecurityHealthProvider);
    final healthsWithoutFalse = healths.where((element) => element.status);
    final method = ref.watch($VerificationMethodProvider);

    return AccountSecurityHealthFetchCard(
      child: CardWrapper(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            _SelectVerificationMethod(
              method: method,
              healthsWithoutFalse: healthsWithoutFalse,
            ),
            _SwitchVerificationChildren(method: method),
          ],
        ),
      ),
    );
  }
}

class _SwitchVerificationChildren extends ConsumerWidget {
  const _SwitchVerificationChildren({
    Key? key,
    required this.method,
  }) : super(key: key);

  final UserSecurityFields? method;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (method == null) return const SizedBox.shrink();

    switch (method!) {
      case UserSecurityFields.phone:
      case UserSecurityFields.email:
        return buildOneTimePasswordField(context, ref);

      case UserSecurityFields.password:
        return buildPassword(context, ref);
    }
  }

  Widget buildOneTimePasswordField(BuildContext context, WidgetRef ref) {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: '输入验证码',
        border: const OutlineInputBorder(borderSide: BorderSide.none),
        contentPadding: const EdgeInsets.symmetric(horizontal: 0),
        suffixIcon: buildSendOneTimePasswordButton(context, ref),
      ),
    );
  }

  Widget buildSendOneTimePasswordButton(BuildContext context, WidgetRef ref) {
    final UserSecurityFields? method =
        ref.watch(VerificationCard.$VerificationMethodProvider);
    if (method == null) return const SizedBox.shrink();

    return SendOntTimePasswordBinder.forAuth(
      phone: method == UserSecurityFields.phone,
      email: method == UserSecurityFields.email,
    );
  }

  Widget buildPassword(BuildContext context, WidgetRef ref) {
    return const TextField(
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        hintText: '请输入原密码',
        border: OutlineInputBorder(borderSide: BorderSide.none),
        contentPadding: EdgeInsets.symmetric(horizontal: 0),
      ),
    );
  }
}

class _SelectVerificationMethod extends ConsumerWidget {
  const _SelectVerificationMethod({
    Key? key,
    required this.method,
    required this.healthsWithoutFalse,
  }) : super(key: key);

  final UserSecurityFields? method;
  final Iterable<AccountSecurityHealthResult> healthsWithoutFalse;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        ref
            .read(VerificationCard.$VerificationMethodProvider.notifier)
            .update((state) => field);
      },
    );
  }
}
