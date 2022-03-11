import 'package:flutter/material.dart';

class UnfocusWidget extends StatelessWidget {
  final Widget child;

  const UnfocusWidget({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: child,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
    );
  }
}
