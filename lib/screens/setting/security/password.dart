import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../api/api.dart';
import '../../../providers/api.dart';
import '../../../widgets/card_wrapper.dart';
import '../../../widgets/dynamic_app_bar.dart';
import '../../../widgets/unfocus.dart';
import 'widgets/account_security_health_fetch_card.dart';
import 'widgets/verification_card.dart';

final AutoDisposeChangeNotifierProvider<TextEditingController>
    $PasswordControllerProvider =
    ChangeNotifierProvider.autoDispose<TextEditingController>(
  (ref) => TextEditingController(),
);
final StateProvider<bool> $SubmitStateProvider = StateProvider((ref) => false);

class AccountSecurityPasswordScreen extends ConsumerWidget {
  const AccountSecurityPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () async => _onWillPop(ref),
      child: UnfocusWidget(
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
              VerificationCard(),
            ],
          ),
        ),
      ),
    );
  }

  bool _onWillPop(WidgetRef ref) {
    return !ref.read($SubmitStateProvider);
  }

  Widget titleBuilder(BuildContext context, double opacity) {
    return const _AppBarTitle();
  }

  List<Widget> submitButtonBuilder(BuildContext context, double opacity) {
    return [const _SubmitButton()];
  }
}

class _SubmitButton extends ConsumerWidget {
  const _SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.watch($SubmitStateProvider)) {
      return const IconButton(
        icon: SizedBox.square(
          child: CircularProgressIndicator(strokeWidth: 2),
          dimension: 20,
        ),
        onPressed: null,
      );
    }

    final String password = ref.watch(
        $PasswordControllerProvider.select((value) => value.text.trim()));
    final UserSecurityFields? verificationMethod =
        ref.watch($VerificationMethodProvider);
    final String verificationValue = ref.watch(
        $VerificationValueControllerProvider.select((value) => value.text));

    if (password.isEmpty ||
        verificationMethod == null ||
        verificationValue.isEmpty) {
      return const TextButton(onPressed: null, child: Text('提交'));
    }

    return TextButton(
      onPressed: _createOnPressed(context, ref),
      child: const Text('提交'),
    );
  }

  VoidCallback _createOnPressed(BuildContext context, WidgetRef ref) {
    return () async {
      final String password = ref.read($PasswordControllerProvider).text.trim();
      final UserSecurityFields? verificationMethod =
          ref.read($VerificationMethodProvider);
      final String verificationValue =
          ref.read($VerificationValueControllerProvider).text;

      // If password is empty or length < 12, show error.
      if (password.isEmpty || password.length < 6) {
        return _showErrorMessage(context, '密码长度不能小于6位');
      }

      // If verification method is null, show error.
      if (verificationMethod == null) {
        return _showErrorMessage(context, '请选择验证方式');
      }

      // If verification method is password, and new password is equal to old password, show error.
      if (verificationMethod == UserSecurityFields.password &&
          password == verificationValue) {
        return _showErrorMessage(context, '新密码不能与原密码相同');
      }

      // Validate verification value.
      final next = _validateVerificationValue(
          context, verificationMethod, verificationValue);
      if (next == false) return;

      /// Get Account security service
      final AccountSecurityService accountSecurityService =
          ref.read($APIProvider).accountSecurity;

      try {
        ref.read($SubmitStateProvider.notifier).update((state) => true);

        /// Update password
        await accountSecurityService.updatePassword(
          password: password,
          verificationField: verificationMethod,
          verificationValue: verificationValue,
        );

        /// Update password health
        await ref.read($AccountSecurityHealthProvider.notifier).fetch();

        /// Back to account security page
        context.pop();
      } catch (error) {
        return _showErrorMessage(
          context,
          error is FormatException ? error.message : error.toString(),
        );
      } finally {
        ref.read($SubmitStateProvider.notifier).update((state) => false);
      }
    };
  }

  bool _validateVerificationValue(
      BuildContext context, UserSecurityFields method, String value) {
    // If verification value is password.
    if (method == UserSecurityFields.password && value.isEmpty) {
      _showErrorMessage(context, '请输入原密码');
      return false;
    }

    // If verification value is code.
    if (value.isEmpty) {
      _showErrorMessage(context, '请输入验证码');
      return false;
    }

    return true;
  }

  void _showErrorMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CardWrapper(
      child: TextField(
        obscureText: true,
        keyboardType: TextInputType.visiblePassword,
        controller: ref.watch($PasswordControllerProvider),
        decoration: const InputDecoration(
          hintText: '请输入新密码',
          border: OutlineInputBorder(borderSide: BorderSide.none),
          contentPadding: EdgeInsets.symmetric(horizontal: 24),
        ),
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
