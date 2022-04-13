import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../api/api.dart';
import '../../../widgets/card_wrapper.dart';
import '../../../widgets/dynamic_app_bar.dart';
import '../../../widgets/unfocus.dart';
import 'widgets/account_security_health_fetch_card.dart';
import 'widgets/verification_card.dart';

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
            VerificationCard(),
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
        $AccountSecurityHealthProvider.select((element) => element.singleWhere(
            (element) => element.field == UserSecurityFields.password));
    final AccountSecurityHealthResult health = ref.watch(provider);

    return Text(health.status ? '更改密码' : '设置密码');
  }
}
