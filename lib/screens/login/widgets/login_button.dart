import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../graphql/auth/auth_box.dart';
import '../../../hive/hive.dart';
import '../graphql/login.mutation.dart';
import '../login_state.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool useOTP =
        context.select<LoginState, bool>((state) => state.useOTP);
    final bool hasLogging =
        context.select<LoginState, bool>((state) => state.hasLogging);

    final Widget child = hasLogging
        ? const SizedBox.square(
            dimension: 24,
            child: CircularProgressIndicator.adaptive(),
          )
        : Text(
            useOTP ? '注册/登录' : '登录',
            style: const TextStyle(
              fontSize: 16,
            ),
          );

    return ElevatedButton(
      onPressed: hasLogging ? null : () => onLoginWillPop(context),
      child: child,
      style: ButtonStyle(
        padding:
            MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 14)),
        shape: MaterialStateProperty.all(const StadiumBorder()),
      ),
    );
  }

  Future<void> onLoginWillPop(BuildContext context) async {
    final LoginState state = context.read<LoginState>();
    final hasNext = await onValidateForm(state);
    if (hasNext == false) return;

    try {
      final AccessToken accessToken = await login(
        usePhoneOtp: state.useOTP,
        account: state.account.text.trim(),
        password: state.password.text,
      );
      await AuthBox.set(accessToken);
    } catch (e) {
      if (e.toString() == 'User not found') {
        state.setAccountInputErrorMessage(e.toString());
      } else {
        state.setPasswordInputErrorMessage(e.toString());
      }
    }
    // TODO:登录成功后，返回上级页面，并设置登录状态
  }

  Future<bool> onValidateForm(LoginState state) async {
    if (state.agreement != true) {
      state.setPasswordInputErrorMessage('请同意下方协议');
      return false;
    }
    if (state.useOTP) {
      return onValidateOTPForm(state);
    }

    final String account = state.account.text.trim();
    final String password = state.password.text;
    if (account.isEmpty) {
      state.setAccountInputErrorMessage('请输入账号');
      return false;
    } else if (password.isEmpty) {
      state.setPasswordInputErrorMessage('请输入密码');
      return false;
    }

    state.clearAccountInputErrorMessage();
    state.clearPasswordInputErrorMessage();

    return true;
  }

  bool onValidateOTPForm(LoginState state) {
    final String account = state.account.text.trim();
    final String otp = state.password.text.trim();
    if (account.isEmpty) {
      state.setAccountInputErrorMessage('请输入手机号码');
      return false;
    } else if (account.length != 11 || !account.startsWith('1')) {
      state.setAccountInputErrorMessage('请输入正确的手机号码');
      return false;
    } else if (otp.isEmpty) {
      state.setPasswordInputErrorMessage('请输入验证码');
      return false;
    }

    state.clearAccountInputErrorMessage();
    state.clearPasswordInputErrorMessage();
    return true;
  }
}
