import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login_state.dart';

class LoginAgreementWidget extends StatelessWidget {
  const LoginAgreementWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        _AgreementRadioWidget(),
        Expanded(child: _AgreementTextWidget()),
      ],
    );
  }
}

class _AgreementTextWidget extends StatefulWidget {
  const _AgreementTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<_AgreementTextWidget> createState() => _AgreementTextWidgetState();
}

class _AgreementTextWidgetState extends State<_AgreementTextWidget> {
  late TapGestureRecognizer userAgreementTapGestureRecognizer;
  late TapGestureRecognizer privacyPolicyTapGestureRecognizer;

  @override
  void initState() {
    super.initState();
    userAgreementTapGestureRecognizer = TapGestureRecognizer()
      ..onTap = onUserAgreementTap;
    privacyPolicyTapGestureRecognizer = TapGestureRecognizer()
      ..onTap = onPrivacyPolicyTap;
  }

  @override
  void dispose() {
    userAgreementTapGestureRecognizer.dispose();
    privacyPolicyTapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          const TextSpan(text: '阅读并同意'),
          TextSpan(
            text: '《用户协议》',
            recognizer: userAgreementTapGestureRecognizer,
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
          const TextSpan(text: '和'),
          TextSpan(
            text: '《隐私政策》',
            recognizer: privacyPolicyTapGestureRecognizer,
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ],
      ),
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }

  void onUserAgreementTap() {
    // TODO: open user agreement page
  }

  void onPrivacyPolicyTap() {
    // TODO: open privacy policy page
  }
}

class _AgreementRadioWidget extends StatelessWidget {
  const _AgreementRadioWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Radio<bool>(
      toggleable: true,
      value: context.select<LoginState, bool>(valueSeletor),
      groupValue: true,
      onChanged: (_) => context.read<LoginState>().toggleAgreement(),
    );
  }

  bool valueSeletor(LoginState state) => state.agreement;
}
