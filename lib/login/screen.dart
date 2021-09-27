import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        foregroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: const CloseButton(),
      ),
      body: ListView(
        padding:
            const EdgeInsets.symmetric(horizontal: 24.0).copyWith(top: 96.0),
        children: [
          const SizedBox(height: 32.0),
          Container(
            width: 120,
            height: 120,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/logo.png'),
              ),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(height: 32.0),
          TextField(
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
                prefixIcon: const Icon(Icons.phone_iphone)),
          ),
          Row(
            children: [
              Radio(
                value: true,
                groupValue: false,
                onChanged: (bool? value) {},
              ),
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: '需要同意'),
                    TextSpan(text: '《用户协议》'),
                    TextSpan(text: '与'),
                    TextSpan(text: '《隐私政策》'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24.0),
          Center(
            child: ConstrainedBox(
              constraints:
                  const BoxConstraints.expand(width: 64.0, height: 64.0),
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
      ),
    );
  }
}
