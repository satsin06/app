import 'package:flutter/material.dart';

class CardWrapper extends StatelessWidget {
  const CardWrapper({
    Key? key,
    required this.child,
    this.margin = const EdgeInsets.symmetric(horizontal: 16),
    this.padding,
  }) : super(key: key);

  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final Widget widget = padding is EdgeInsetsGeometry
        ? Padding(padding: padding!, child: child)
        : child;

    final Widget card = Card(
      margin: margin,
      child: widget,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );

    return card;
  }
}
