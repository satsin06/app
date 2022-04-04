import 'package:flutter_riverpod/flutter_riverpod.dart';

enum LoginMode {
  password,
  otp,
}

final loginModeProvider = StateProvider(
  (Ref ref) => LoginMode.otp,
);

final hasLoginModeProvider = Provider.autoDispose.family(
  (Ref ref, LoginMode value) {
    return ref.watch(loginModeProvider) == value;
  },
);
