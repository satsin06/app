import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Sign in mode types
enum SignInMode {
  PASSWORD,
  SMS_CODE,
}

class SignInController extends GetxController {
  /// Sign in mode
  final Rx<SignInMode> mode = Rx<SignInMode>(SignInMode.SMS_CODE);

  /// Sign in account
  final Rx<String> account = Rx<String>('');
  final TextEditingController accountController = TextEditingController();

  /// Security, [mode] == [SignInMode.PASSWORD] is password login,
  /// [mode] == [SignInMode.SMS_CODE] is SMS code register or login.
  final Rx<String> security = Rx<String>('');
  final TextEditingController securityController = TextEditingController();

  /// Switch mode.
  ///
  /// [mode] is [SignInMode] values.
  switchMode(SignInMode mode) {
    this.mode.value = mode;
    if (mode == SignInMode.SMS_CODE && !account.value.isPhoneNumber) {
      accountController.clear();
    }
  }

  @override
  void onInit() {
    super.onInit();
    accountController.addListener(() {
      account.value = accountController.text;
    });
    securityController.addListener(() {
      security.value = securityController.text;
    });
  }

  @override
  void onClose() {
    super.onClose();
    accountController.dispose();
    securityController.dispose();
  }
}
