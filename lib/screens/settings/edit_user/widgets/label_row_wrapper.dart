import 'package:flutter/material.dart';

class LabelRowWrapper extends StatelessWidget {
  const LabelRowWrapper({
    Key? key,
    this.label,
    this.child,
    this.labelText,
    this.text,
  }) : super(key: key);

  final String? labelText;
  final String? text;
  final Widget? label;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final Widget labelWidget = label ??
        Text(
          labelText!,
          style: Theme.of(context).textTheme.bodyMedium,
        );
    final Widget textWidget = child ??
        Text(
          text!,
          style: Theme.of(context).textTheme.bodyLarge,
        );

    return Row(
      children: [
        SizedBox(
          width: 60,
          child: labelWidget,
        ),
        Expanded(
          child: textWidget,
        ),
      ],
    );
  }
}
