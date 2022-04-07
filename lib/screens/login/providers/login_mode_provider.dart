import 'package:flutter_riverpod/flutter_riverpod.dart';

enum LoginMode {
  password,
  otp,
}

final loginModeProvider = StateProvider.autoDispose(
  (Ref ref) => LoginMode.otp,
);
