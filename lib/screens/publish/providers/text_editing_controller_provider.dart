import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final titleTextEditingControllerProvider =
    ChangeNotifierProvider<TextEditingController>(
  (_) => TextEditingController(),
);

final contentTextEditingControllerProvider =
    ChangeNotifierProvider<TextEditingController>(
  (_) => TextEditingController(),
);
