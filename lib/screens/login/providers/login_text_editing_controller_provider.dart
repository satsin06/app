import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginAccountTextEditingControllerProvider = Provider(
  (Ref ref) => TextEditingController(),
);

final loginPasswordTextEditingControllerProvider = Provider(
  (Ref ref) => TextEditingController(),
);
