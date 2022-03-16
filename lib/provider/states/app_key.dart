import 'package:flutter/widgets.dart';

class AppKeyState extends ValueNotifier<Key> {
  AppKeyState() : super(UniqueKey());

  /// Change the [AppKey] value to a new [Key].
  void change() => value = UniqueKey();
}
