import 'package:get/get.dart';

/// Sign in mode types
enum SignInMode {
  PASSWORD,
  SMS_CODE,
}

class SignInController extends GetxController {
  /// Sign in mode
  Rx<SignInMode> mode = Rx<SignInMode>(SignInMode.SMS_CODE);

  /// Sign in account
  Rx<String> account = Rx<String>('');

  /// Security, [mode] == [SignInMode.PASSWORD] is password login,
  /// [mode] == [SignInMode.SMS_CODE] is SMS code register or login.
  Rx<String> security = Rx<String>('');

  /// Switch mode.
  ///
  /// [mode] is [SignInMode] values.
  switchMode(SignInMode mode) {
    this.mode.value = mode;

    if (!account.value.isPhoneNumber) {
      this.account.value = '';
    }
  }
}
