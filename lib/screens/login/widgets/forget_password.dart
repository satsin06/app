import 'package:flutter/material.dart';

class LoginForgetPasswordWidget extends StatelessWidget {
  const LoginForgetPasswordWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(onPressed: () {}, child: const Text('忘记密码？')),
      ],
    );
  }
}
