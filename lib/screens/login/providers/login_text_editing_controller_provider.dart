import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginAccountTextEditingControllerProvider =
    ChangeNotifierProvider.autoDispose(
  (Ref ref) => TextEditingController(),
);

final loginPasswordTextEditingControllerProvider =
    ChangeNotifierProvider.autoDispose(
  (Ref ref) => TextEditingController(),
);
