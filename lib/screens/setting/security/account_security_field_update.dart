import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../api/api.dart';
import '../../../providers/api.dart';
import '../../../widgets/card_wrapper.dart';
import '../../../widgets/dynamic_app_bar.dart';
import '../../../widgets/send_ont_time_password_binder.dart';
import '../../../widgets/unfocus.dart';
import 'widgets/account_security_health_fetch_card.dart';
import 'widgets/account_security_verification_card.dart';

/// Submit state provider, sending the request to the server and updating the
/// state of the submit button.
/// - `true` if the request is in progress
/// - `false` if the request is not in progress
final $SubmitStateProvider = StateProvider.autoDispose<bool>((ref) => false);

/// New field value text editing controller.
///
/// - `UserSecurityFields.phone`: The phone text editing controller
/// - `UserSecurityFields.password`: The password text editing controller
/// - `UserSecurityFields.email`: The email text editing controller
final $NewFieldValueControllerProvider = ChangeNotifierProvider.autoDispose(
  (ref) => TextEditingController(),
);

/// New field value one-time password text editing controller.
///
/// Only used for [UserSecurityFields.phone] and [UserSecurityFields.email].
final $OneTimePasswordControllerProvider = ChangeNotifierProvider.autoDispose(
  (ref) => TextEditingController(),
);

/// Change account security binding fields screen.
///
/// - [UserSecurityFields.phone]: Change phone number
/// - [UserSecurityFields.password]: Change password
/// - [UserSecurityFields.email]: Change email
class AccountSecurityUpdateFieldScreen extends ConsumerWidget {
  const AccountSecurityUpdateFieldScreen(this.field, {Key? key})
      : super(key: key);

  final UserSecurityFields field;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () async => _onWillPop(ref),
      child: UnfocusWidget(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: DynamicAppBar(
            title: _titleBuilder,
            actions: _submitButtonBuilder,
          ),
          body: _FormListView(field),
        ),
      ),
    );
  }

  bool _onWillPop(WidgetRef ref) {
    return !ref.read($SubmitStateProvider);
  }

  Widget _titleBuilder(BuildContext context, double opacity) {
    return _AppBarTitle(field);
  }

  List<Widget> _submitButtonBuilder(BuildContext context, double opacity) {
    return [_SubmitButton(field)];
  }
}

class _AppBarTitle extends ConsumerWidget {
  const _AppBarTitle(this.field, {Key? key}) : super(key: key);

  final UserSecurityFields field;

  ProviderListenable<bool> get $HealthStatusProvider =>
      $AccountSecurityHealthProvider.select<bool>(
        (List<AccountSecurityHealthResult> results) {
          return results
              .singleWhere(
                (element) => element.field == field,
                orElse: () => AccountSecurityHealthResult(field, status: false),
              )
              .status;
        },
      );

  Map<bool, String> get statusText => {
        true: '更换',
        false: '设置',
      };

  Map<UserSecurityFields, String> get fieldText => {
        UserSecurityFields.email: '电子邮箱',
        UserSecurityFields.phone: '手机号码',
        UserSecurityFields.password: '密码',
      };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool status = ref.watch($HealthStatusProvider);
    final String text = statusText[status]! + fieldText[field]!;
    final TextStyle? style = Theme.of(context).textTheme.headline6;

    return Text(text, style: style);
  }
}

class _SubmitButton extends ConsumerWidget {
  const _SubmitButton(this.field, {Key? key}) : super(key: key);

  final UserSecurityFields field;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.watch($SubmitStateProvider)) {
      return const _DisabledSubmitButton.sending();
    }

    final bool disabled = _isDisabled(ref);
    if (disabled) return const _DisabledSubmitButton();

    return TextButton(
      onPressed: _createOnPressed(context, ref),
      child: const Text('提交'),
    );
  }

  /// Whether the submit button is disabled.
  bool _isDisabled(WidgetRef ref) {
    if (_isDisabledForVerification(ref)) return true;

    switch (field) {
      case UserSecurityFields.email:
        return _isEmailDisabled(ref);
      case UserSecurityFields.phone:
        return _isPhoneDisabled(ref);
      case UserSecurityFields.password:
        return _isPasswordDisabled(ref);
    }
  }

  /// Whether the submit button is disabled for verification.
  bool _isDisabledForVerification(WidgetRef ref) {
    final UserSecurityFields? verificationField =
        ref.watch($VerificationFieldProvider);
    if (verificationField == null) return true;

    final verificationValue = ref.watch($VerificationValueControllerProvider
        .select((controller) => controller.text.trim()));
    if (verificationValue.isEmpty) return true;

    return false;
  }

  /// Whether the submit button is disabled for email.
  bool _isEmailDisabled(WidgetRef ref) {
    final String email =
        ref.watch($NewFieldValueControllerProvider).text.trim();
    if (email.isEmpty) return true;

    final String oneTimePassword =
        ref.watch($OneTimePasswordControllerProvider).text.trim();
    if (oneTimePassword.isEmpty) return true;

    return false;
  }

  /// Whether the submit button is disabled for phone.
  bool _isPhoneDisabled(WidgetRef ref) {
    final String phone =
        ref.watch($NewFieldValueControllerProvider).text.trim();
    if (phone.isEmpty) return true;

    final String oneTimePassword =
        ref.watch($OneTimePasswordControllerProvider).text.trim();
    if (oneTimePassword.isEmpty) return true;

    return false;
  }

  /// Whether the submit button is disabled for password.
  bool _isPasswordDisabled(WidgetRef ref) {
    final String password =
        ref.watch($NewFieldValueControllerProvider).text.trim();
    if (password.isEmpty) return true;

    return false;
  }

  /// Create the onPressed callback for the submit button.
  VoidCallback _createOnPressed(BuildContext context, WidgetRef ref) {
    return () async {
      /// Set submit state to true
      ref.read($SubmitStateProvider.notifier).update((state) => true);

      /// Create account security update requester for the field
      final updateRequester = _createUpdateRequester(ref);

      /// Create health results update requester
      final healthResultsRequester = _createHealthResultsRequester(ref);

      /// Using try catch to handle errors
      /// and set submit state to false
      try {
        /// Update account security
        await updateRequester();

        /// Update health results
        await healthResultsRequester();

        /// Back to previous screen
        Navigator.of(context).pop();
      } catch (e) {
        /// show error message
        _showErrorMessage(context, e);
      } finally {
        /// Set submit state to false
        ref.read($SubmitStateProvider.notifier).update((state) => false);
      }
    };
  }

  /// Show error message
  void _showErrorMessage(BuildContext context, Object error) {
    final String message =
        error is FormatException ? error.message : error.toString();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  /// Create account security update requester for the field
  /// and return the requester
  Future<void> Function() _createUpdateRequester(WidgetRef ref) {
    return () async {
      final UserSecurityFields? verificationField =
          ref.watch($VerificationFieldProvider);
      final String verificationValue =
          ref.read($VerificationValueControllerProvider).text.trim();
      final String fieldValue =
          ref.read($NewFieldValueControllerProvider).text.trim();

      if (verificationField == field &&
          field == UserSecurityFields.password &&
          verificationValue == fieldValue) {
        throw const FormatException('新密码不能与原密码相同');
      }

      /// Valicate E-Mail address
      if (field == UserSecurityFields.email &&
          EmailAddress.parse(fieldValue) == null) {
        throw const FormatException('邮箱地址格式不正确');
      }

      switch (field) {
        case UserSecurityFields.email:
          return await _onUpdateEmailHandler(ref);
        case UserSecurityFields.phone:
          return await _onUpdatePhoneHandler(ref);
        case UserSecurityFields.password:
          return await _onUpdatePasswordHandler(ref);
      }
    };
  }

  /// Create health results update requester
  /// and return the requester
  Future<void> Function() _createHealthResultsRequester(WidgetRef ref) {
    return () async =>
        await ref.read($AccountSecurityHealthProvider.notifier).fetch();
  }

  // Update email handler
  Future<void> _onUpdateEmailHandler(WidgetRef ref) async {
    final String email = ref.read($NewFieldValueControllerProvider).text.trim();
    final String otp = ref.read($OneTimePasswordControllerProvider).text.trim();
    final UserSecurityFields? verificationField =
        ref.read($VerificationFieldProvider);
    final String verificationValue =
        ref.read($VerificationValueControllerProvider).text.trim();

    await ref.read($APIProvider).accountSecurity.updateEmail(
        email: email,
        otp: otp,
        verificationField: verificationField!,
        verificationValue: verificationValue);
  }

  // Update phone handler
  Future<void> _onUpdatePhoneHandler(WidgetRef ref) async {
    final String phone = ref.read($NewFieldValueControllerProvider).text.trim();
    final String otp = ref.read($OneTimePasswordControllerProvider).text.trim();
    final UserSecurityFields? verificationField =
        ref.read($VerificationFieldProvider);
    final String verificationValue =
        ref.read($VerificationValueControllerProvider).text.trim();

    await ref.read($APIProvider).accountSecurity.updatePhone(
        phone: phone,
        otp: otp,
        verificationField: verificationField!,
        verificationValue: verificationValue);
  }

  // Update password handler
  Future<void> _onUpdatePasswordHandler(WidgetRef ref) async {
    final String password =
        ref.read($NewFieldValueControllerProvider).text.trim();
    final UserSecurityFields? verificationField =
        ref.read($VerificationFieldProvider);
    final String verificationValue =
        ref.read($VerificationValueControllerProvider).text.trim();

    await ref.read($APIProvider).accountSecurity.updatePassword(
        password: password,
        verificationField: verificationField!,
        verificationValue: verificationValue);
  }
}

class _DisabledSubmitButton extends StatelessWidget {
  const _DisabledSubmitButton({Key? key, this.child}) : super(key: key);
  const _DisabledSubmitButton.sending({Key? key})
      : this(key: key, child: const _DisabledSendingWidget());

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    if (child != null) return child!;

    return const TextButton(onPressed: null, child: Text('提交'));
  }
}

class _DisabledSendingWidget extends StatelessWidget {
  const _DisabledSendingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const IconButton(
      icon: SizedBox.square(
        child: CircularProgressIndicator(strokeWidth: 2),
        dimension: 20,
      ),
      onPressed: null,
    );
  }
}

class _FormListView extends StatelessWidget {
  const _FormListView(this.field, {Key? key}) : super(key: key);

  final UserSecurityFields field;

  @override
  Widget build(BuildContext context) {
    final EdgeInsets padding = MediaQuery.of(context).padding;
    return ListView(
      padding: padding,
      children: [
        _CardTitle(field),
        _CardContent(field),
        const SizedBox(height: 16),
        const AccountSecurityVerificationCard(),
      ],
    );
  }
}

class _CardTitle extends StatelessWidget {
  const _CardTitle(this.field, {Key? key}) : super(key: key);

  final UserSecurityFields field;

  Map<UserSecurityFields, String> get titleMap => {
        UserSecurityFields.email: '新电子邮箱',
        UserSecurityFields.phone: '新手机号码',
        UserSecurityFields.password: '新密码',
      };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Text(
        titleMap[field]!,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}

class _CardContent extends StatelessWidget {
  const _CardContent(this.field, {Key? key}) : super(key: key);

  final UserSecurityFields field;

  @override
  Widget build(BuildContext context) {
    if (field == UserSecurityFields.password) {
      return const CardWrapper(
        child: _NewFieldValueTextField(UserSecurityFields.password),
      );
    }

    return CardWrapper(
      child: Column(
        children: [
          _NewFieldValueTextField(field),
          const Divider(height: 0),
          _OneTimePasswordTextField(field),
        ],
      ),
    );
  }
}

class _NewFieldValueTextField extends ConsumerWidget {
  final UserSecurityFields field;

  const _NewFieldValueTextField(this.field, {Key? key}) : super(key: key);

  Map<UserSecurityFields, String> get hintTextMap => {
        UserSecurityFields.email: '请输入新电子邮箱地址',
        UserSecurityFields.phone: '请输入新手机号码',
        UserSecurityFields.password: '请输入新密码',
      };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      obscureText: field == UserSecurityFields.password,
      keyboardType: TextInputType.visiblePassword,
      controller: ref.watch($NewFieldValueControllerProvider),
      decoration: InputDecoration(
        hintText: hintTextMap[field],
        border: const OutlineInputBorder(borderSide: BorderSide.none),
        contentPadding: const EdgeInsets.symmetric(horizontal: 24),
      ),
    );
  }
}

class _OneTimePasswordTextField extends ConsumerWidget {
  final UserSecurityFields field;

  const _OneTimePasswordTextField(this.field, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      obscureText: false,
      keyboardType: TextInputType.text,
      controller: ref.watch($OneTimePasswordControllerProvider),
      decoration: InputDecoration(
        hintText: '请输入验证码',
        border: const OutlineInputBorder(borderSide: BorderSide.none),
        contentPadding: const EdgeInsets.symmetric(horizontal: 24),
        suffixIcon: _SendOnePasswordButton(field),
      ),
    );
  }
}

class _SendOnePasswordButton extends ConsumerWidget {
  final UserSecurityFields field;

  const _SendOnePasswordButton(this.field, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String account =
        ref.watch($NewFieldValueControllerProvider).text.trim();
    return SendOntTimePasswordBinder.forTarget(
      phone: field == UserSecurityFields.phone ? account : null,
      email: field == UserSecurityFields.email ? account : null,
      errorNotifier: _createErrorNotifier(ref),
      builder: _createBuilder(ref, account),
    );
  }

  SendOntTimePasswordWidgetBuilder _createBuilder(
      WidgetRef ref, String account) {
    return (
      BuildContext context, {
      required bool sending,
      required int seconds,
      VoidCallback? onPressed,
    }) {
      if (account.isEmpty) {
        return const TextButton(
          onPressed: null,
          child: Text('获取验证码'),
        );
      }

      return defaultSendOneTimePasswordWidgetBuilder(
        context,
        sending: sending,
        seconds: seconds,
        onPressed: onPressed,
      );
    };
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
