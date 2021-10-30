import 'package:flutter/cupertino.dart';

import '../full_screen_dialog_wrapper.dart';

class LoginDialog extends StatelessWidget {
  const LoginDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const FullScreenDialogWrapper();
  }

  static open(BuildContext context) {
    Navigator.of(context).push(
      CupertinoDialogRoute(
        builder: (_) => const LoginDialog(),
        context: context,
      ),
    );
  }
}