import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginAccountTextEditingControllerProvider = Provider.autoDispose(
  (Ref ref) => TextEditingController(),
);

final loginPasswordTextEditingControllerProvider = Provider.autoDispose(
  (Ref ref) => TextEditingController(),
);
