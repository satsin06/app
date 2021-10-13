import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:socfony/graphql/client.dart';
import 'package:socfony/graphql/mutations/send_sms_verification_code.dart';
import 'package:socfony/screens/login/store.dart';
import 'package:socfony/store/verification_code.response.dart';
import 'package:socfony/widgets/tap_blank_space_collapse_keyboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginStore store = LoginStore();
  late final Timer timer;
  final PhoneParser phoneParse = PhoneParser();

  _LoginScreenState() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (store.countdown > 0) {
        store.countdown--;
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TapBlankSpaceCollapseKeyboard(
      child: Form(
        child: scaffold,
        onWillPop: onWillPop,
      ),
    );
  }

  Scaffold get scaffold => Scaffold(
        extendBodyBehindAppBar: false,
        appBar: appBar,
        body: body,
      );

  AppBar get appBar => AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        automaticallyImplyLeading: true,
      );

  Widget get body => ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        children: [
          header,
          phoneInput,
          codeInput,
          agreement,
          loginButton,
        ],
      );

  Widget get header => Container(
        height: 146.0,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/login_head.png'),
          ),
          shape: BoxShape.rectangle,
        ),
      );

  Widget get phoneInput => Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: PhoneFormField(
          decoration: InputDecoration(
            labelText: '手机号码',
            hintText: '请输入手机号码',
            border: inputBorder,
            contentPadding: EdgeInsets.zero,
            prefixIcon: const Icon(Icons.phone_iphone),
          ),
          // defaultCountry: Localizations.localeOf(context).countryCode ?? 'US',
          // TODO: 暂时仅支持中国手机号码
          defaultCountry: 'CN',
          errorText: '手机号码不正确',
          onChanged: (value) => store.phone = value,
          showFlagInInput: false,
          phoneNumberType: PhoneNumberType.mobile,
          initialValue: store.phone,
        ),
      );

  Widget get codeInput => Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: TextFormField(
          initialValue: store.code,
          keyboardType: TextInputType.number,
          onChanged: (value) => store.code = value,
          decoration: InputDecoration(
            labelText: '验证码',
            hintText: '请输入验证码',
            border: inputBorder,
            contentPadding: EdgeInsets.zero,
            prefixIcon: const Icon(Icons.verified_user),
            suffixIcon: Observer(
                builder: (_) => TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            EdgeInsets.zero.copyWith(right: 24.0)),
                      ),
                      child: getCodeChild,
                      onPressed:
                          store.countdown > 0 ? null : onSendVerificationCode,
                    )),
          ),
        ),
      );

  Widget get getCodeChild {
    if (store.countdown > 0) {
      return Text('${store.countdown}s');
    }

    return const Text('获取验证码');
  }

  InputBorder get inputBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(64.0),
      );

  Widget get agreement => Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: Row(
          children: [
            Observer(
                builder: (_) => Checkbox(
                    value: store.agreement,
                    onChanged: (value) {
                      store.agreement = value == true;
                      onWillPop();
                    })),
            const Text('我已阅读并同意'),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/agreement'),
              child: Text('《用户协议》',
                  style: TextStyle(color: Theme.of(context).primaryColor)),
            ),
          ],
        ),
      );

  Widget get loginButton => Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: Center(
          child: SizedBox(
            width: 160.0,
            height: 48.0,
            child: ElevatedButton(
              onPressed: onLogin,
              child: const Text('登录'),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(64.0)),
                ),
              ),
            ),
          ),
        ),
      );

  Future<bool> onWillPop() async {
    FocusScope.of(context).unfocus();

    return true;
  }

  void onLogin() async {
    FocusScope.of(context).unfocus();

    final bool validated =
        validatePhone() && validateCode() && validateAgreement();
    if (!validated) {
      return;
    }

    // TODO: Login
  }

  Future<void> onSendVerificationCode() async {
    FocusScope.of(context).unfocus();

    if (validatePhone() == false) {
      return;
    }

    final response = await graphql(
      query: sendSmsVerificationCode,
      variables: {
        'phone': store.phone!.international,
      },
    );
    if (response.errors != null && response.errors!.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(response.errors![0].message),
      ));
      return;
    }

    final json = response.data!['sendSmsVerificationCode'];
    final data = VerificationCodeResponse.fromJson(json);
    GetIt.I<VerificationCodeResponse>().update(data);
    store.countdown = 60;
  }

  bool validateAgreement() {
    if (store.agreement == false) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('请阅读并同意用户协议'),
        duration: Duration(seconds: 2),
      ));
      return false;
    }

    return true;
  }

  bool validatePhone() {
    if (store.phone == null || store.phone!.nsn.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('请输入手机号码'),
          duration: Duration(seconds: 2),
        ),
      );
      return false;
    } else if (phoneParse.validate(store.phone!) == false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('手机号码不正确'),
          duration: Duration(seconds: 2),
        ),
      );
      return false;
    }

    return true;
  }

  bool validateCode() {
    if (store.code == null || store.code!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('请输入验证码'),
          duration: Duration(seconds: 2),
        ),
      );
      return false;
    }

    return true;
  }
}
