import 'package:flutter/widgets.dart';

class LoginState with ChangeNotifier {
  final TextEditingController account = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool useOTP = true;
  bool agreement = false;
  bool hasOTPIsSending = false;
  bool hasLogging = false;
  String? accountInputErrorMessage;
  String? passwordInputErrorMessage;

  void toggleAgreement() {
    agreement = !agreement;
    notifyListeners();
  }

  void isSendingOTP() {
    hasOTPIsSending = true;
    notifyListeners();
  }

  void isNotSendingOTP() {
    hasOTPIsSending = false;
    notifyListeners();
  }

  void toggleUseOTP() {
    useOTP = !useOTP;
    account.clear();
    password.clear();
    notifyListeners();
  }

  void setAccountInputErrorMessage(String message) {
    accountInputErrorMessage = message;
    notifyListeners();
  }

  void clearAccountInputErrorMessage() {
    accountInputErrorMessage = null;
    notifyListeners();
  }

  void setPasswordInputErrorMessage(String message) {
    passwordInputErrorMessage = message;
    notifyListeners();
  }

  void clearPasswordInputErrorMessage() {
    passwordInputErrorMessage = null;
    notifyListeners();
  }
}
