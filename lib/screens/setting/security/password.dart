import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/account_security_health.dart';
import '../../../widgets/card_wrapper.dart';
import '../../../widgets/dynamic_app_bar.dart';
import '../../../widgets/unfocus.dart';
import 'providers.dart';

class AccountSecurityPasswordScreen extends StatelessWidget {
  const AccountSecurityPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UnfocusWidget(
      child: Scaffold(
        appBar: DynamicAppBar(
          title: titleBuilder,
          actions: submitButtonBuilder,
        ),
        body: ListView(
          children: const [
            SizedBox(height: 24),
            _NewPasswordCardTitle(),
            _NewPasswordCard(),
            SizedBox(height: 16),
            _VerificationCardTitle(),
            _VerificationCard(),
          ],
        ),
      ),
    );
  }

  Widget titleBuilder(BuildContext context, double opacity) {
    return const _AppBarTitle();
  }

  List<Widget> submitButtonBuilder(BuildContext context, double opacity) {
    return [
      const _SubmitButton(),
    ];
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () {}, child: const Text('提交'));
  }
}

class _VerificationCard extends ConsumerWidget {
  const _VerificationCard({Key? key}) : super(key: key);

  static final AutoDisposeStateProvider<UserSecurityFields?>
      verificationMethodProvider =
      StateProvider.autoDispose<UserSecurityFields?>((ref) => null);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final healths = ref.watch(healthProvider);
    final healthsWithoutFalse = healths.where((element) => element.status);
    final method = ref.watch(verificationMethodProvider);

    return CardWrapper(
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
      case UserSecurityFields.email:
        return buildEmail(context, ref);
      case UserSecurityFields.phone:
        return buildPhone(context, ref);
      case UserSecurityFields.password:
        return buildPassword(context, ref);
    }
  }

  Widget buildEmail(BuildContext context, WidgetRef ref) {
    return const TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: '输入验证码',
        border: OutlineInputBorder(borderSide: BorderSide.none),
        contentPadding: EdgeInsets.symmetric(horizontal: 0),
      ),
    );
  }

  Widget buildPhone(BuildContext context, WidgetRef ref) {
    return const TextField(
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        hintText: '请输入验证码',
        border: OutlineInputBorder(borderSide: BorderSide.none),
        contentPadding: EdgeInsets.symmetric(horizontal: 0),
      ),
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
            .read(_VerificationCard.verificationMethodProvider.notifier)
            .update((state) => field);
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

class _NewPasswordCardTitle extends StatelessWidget {
  const _NewPasswordCardTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Text(
        '新密码',
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}

class _NewPasswordCard extends ConsumerWidget {
  const _NewPasswordCard({
    Key? key,
  }) : super(key: key);

  static final AutoDisposeChangeNotifierProvider<TextEditingController>
      passwordControllerProvider =
      ChangeNotifierProvider.autoDispose<TextEditingController>(
          (ref) => TextEditingController());
  static final AutoDisposeChangeNotifierProvider<TextEditingController>
      confirmControllerProvider =
      ChangeNotifierProvider.autoDispose<TextEditingController>(
          (ref) => TextEditingController());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passwordController = ref.watch(passwordControllerProvider);
    final confirmController = ref.watch(confirmControllerProvider);

    String? errorText;
    if (passwordController.text != confirmController.text &&
        confirmController.text.isNotEmpty) {
      errorText = '两次输入的密码不一致';
    }

    return CardWrapper(
      child: Column(
        children: [
          TextField(
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            controller: passwordController,
            decoration: const InputDecoration(
              hintText: '请输入新密码',
              border: OutlineInputBorder(borderSide: BorderSide.none),
              contentPadding: EdgeInsets.symmetric(horizontal: 24),
            ),
          ),
          const Divider(),
          TextField(
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            controller: confirmController,
            decoration: InputDecoration(
              hintText: '请再次输入新密码',
              errorText: errorText,
              border: const OutlineInputBorder(borderSide: BorderSide.none),
              contentPadding: const EdgeInsets.symmetric(horizontal: 24),
            ),
          ),
        ],
      ),
    );
  }
}

class _AppBarTitle extends ConsumerWidget {
  const _AppBarTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ProviderListenable<AccountSecurityHealthResult> provider =
        healthProvider
            .select(HealthNotofier.selector(UserSecurityFields.password));
    final AccountSecurityHealthResult health = ref.watch(provider);

    return Text(health.status ? '更改密码' : '设置密码');
  }
}
