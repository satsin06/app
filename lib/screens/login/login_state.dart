import 'package:flutter/widgets.dart';

class LoginState with ChangeNotifier {
  String account = '';
  String password = '';
  bool useOTP = true;
  bool agreement = false;
  bool hasOTPIsSending = false;
  bool hasLogging = false;

  void toggleAgreement() {
    agreement = !agreement;
    notifyListeners();
  }

  void updateAccount(String value) {
    account = value;
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
}
