import 'package:flutter/material.dart';

const double kCardMerginHorizontal = 16.0;

class CardWrapper extends StatelessWidget {
  const CardWrapper({
    Key? key,
    required this.child,
    this.margin = const EdgeInsets.symmetric(horizontal: kCardMerginHorizontal),
    this.padding,
  }) : super(key: key);

  final Widget child;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final CardTheme cardTheme = CardTheme.of(context);
    final Widget widget = padding is EdgeInsetsGeometry
        ? Padding(padding: padding!, child: child)
        : child;
    return Card(
      margin: margin,
      shape: cardTheme.shape,
      clipBehavior: cardTheme.clipBehavior,
      elevation: cardTheme.elevation,
      color: cardTheme.color,
      child: widget,
    );
  }
}

class CardExternalTitle extends StatelessWidget {
  const CardExternalTitle(
    this.title, {
    Key? key,
    this.left = kCardMerginHorizontal * 2,
    this.right = kCardMerginHorizontal * 2,
    this.top = kCardMerginHorizontal,
    this.bottom = kCardMerginHorizontal / 2,
  }) : super(key: key);

  final String title;
  final double left;
  final double right;
  final double top;
  final double bottom;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: left,
        right: right,
        top: top,
        bottom: bottom,
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
