import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PublishController extends ChangeNotifier {
  PublishController({
    String? title,
    String? content,
  }) {
    titleTextEditingController = TextEditingController(text: title);
    contentTextEditingController = TextEditingController(text: content)
      ..addListener(() {
        notifyListeners();
      });
  }

  static PublishController of(BuildContext context) =>
      context.read<PublishController>();

  late final TextEditingController titleTextEditingController;
  late final TextEditingController contentTextEditingController;

  String get title => titleTextEditingController.text;
  String get content => contentTextEditingController.text;
}
