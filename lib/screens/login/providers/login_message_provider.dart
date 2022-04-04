import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginAccountMessageProvider = StateProvider.autoDispose<String?>(
  (ref) => null,
);
final loginPasswordMessageProvider = StateProvider.autoDispose<String?>(
  (ref) => null,
);
