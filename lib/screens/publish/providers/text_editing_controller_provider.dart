import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final titleTextEditingControllerProvider =
    ChangeNotifierProvider.autoDispose<TextEditingController>(
  (_) => TextEditingController(),
);

final contentTextEditingControllerProvider =
    ChangeNotifierProvider.autoDispose<TextEditingController>(
  (_) => TextEditingController(),
);
