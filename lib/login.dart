import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.deferToChild,
      onTap: () => onHideKeyboard(context),
      child: ChangeNotifierProvider(
        create: (BuildContext context) => _Login(),
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            automaticallyImplyLeading: true,
            title: const Text('Login'),
            elevation: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            leading: const CloseButton(),
          ),
          body: const _View(),
        ),
      ),
    );
  }

  void onHideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }
}

class _Login with ChangeNotifier {
  String phone = '';
  String code = '';
  bool agreement = false;
  String codeContextId = '';
  int period = 60;

  void changeAgreement(bool value) {
    agreement = value;
    notifyListeners();
  }
}

class _View extends StatelessWidget {
  const _View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0)
          .copyWith(top: MediaQuery.of(context).padding.top),
      children: [
        const _Line(),
        const _AppLogo(),
        const _Line(),
        const _PhoneInput(),
        const _Agreement(),
        const _Line(),
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints.expand(width: 64.0, height: 64.0),
            child: ElevatedButton(
              child: const Icon(CupertinoIcons.arrow_right),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
              ),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}

class _Line extends StatelessWidget {
  const _Line({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 24.0);
  }
}

class _AppLogo extends StatelessWidget {
  const _AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/logo.png'),
        ),
        shape: BoxShape.circle,
      ),
    );
  }
}

class _PhoneInput extends StatelessWidget {
  const _PhoneInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        hintText: '手机号码',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(64.0),
          borderSide: BorderSide.none,
        ),
        filled: true,
        constraints: const BoxConstraints.expand(height: 64.0),
        contentPadding: const EdgeInsets.symmetric(horizontal: 24.0),
        prefixIcon: const Icon(Icons.phone_iphone),
      ),
      onChanged: (String value) => onChanged(context, value),
    );
  }

  void onChanged(BuildContext context, String value) {
    context.read<_Login>().phone = value;
  }
}

class _Agreement extends StatelessWidget {
  const _Agreement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          activeColor: Theme.of(context).primaryColor,
          value: context.select<_Login, bool>((value) => value.agreement),
          onChanged: (bool? value) => onChanged(context, value),
        ),
        Text.rich(
          TextSpan(
            children: [
              const TextSpan(text: '需要同意'),
              TextSpan(
                text: '《用户协议》',
                style: Theme.of(context)
                    .textTheme
                    .caption
                    ?.copyWith(color: Theme.of(context).primaryColor),
              ),
              const TextSpan(text: '与'),
              TextSpan(
                text: '《隐私政策》',
                style: Theme.of(context)
                    .textTheme
                    .caption
                    ?.copyWith(color: Theme.of(context).primaryColor),
              ),
            ],
          ),
          style: Theme.of(context).textTheme.caption,
        ),
      ],
    );
  }

  void onChanged(BuildContext context, bool? value) {
    context.read<_Login>().changeAgreement(value == true);
  }
}
