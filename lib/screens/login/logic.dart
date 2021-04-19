import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../graphql/schema.dart';
import 'state.dart';

/// Login logic
class LoginLogic extends GetxController {
  /// The login logic state.
  final LoginState state = LoginState();

  /// Account input text editing controller.
  final TextEditingController accountController = TextEditingController();

  /// Security input text editing controller.
  final TextEditingController securityController = TextEditingController();

  /// Called immediately after the widget is allocated in memory.
  @override
  void onInit() {
    super.onInit();
    accountController.addListener(() {
      state.account.value = accountController.text;
    });
    securityController.addListener(() {
      state.security.value = securityController.text;
    });
  }

  /// Called before [onDelete] method. [onClose] might be used to
  /// dispose resources used by the controller. Like closing events,
  /// or streams before the controller is destroyed.
  /// Or dispose objects that can potentially create some memory leaks,
  /// like TextEditingControllers, AnimationControllers.
  /// Might be useful as well to persist some data on disk.
  @override
  void onClose() {
    accountController.dispose();
    securityController.dispose();
    super.onClose();
  }

  /// change login page inputs mode.
  ///
  /// [mode] is login type.
  void changeModeHandler(GUserSecurityCompareType mode) {
    Get.focusScope?.unfocus();
    state.mode.value = mode;
    if (mode == GUserSecurityCompareType.PHONE_SMS_CODE &&
        !state.account.value.isPhoneNumber) {
      accountController.clear();
    }
  }

  void switchModeHandler() {
    changeModeHandler(state.mode.value == GUserSecurityCompareType.PASSWORD
        ? GUserSecurityCompareType.PHONE_SMS_CODE
        : GUserSecurityCompareType.PASSWORD);
  }

  void loginHandler() {
    print('Login handler.');
  }

  void changeAgreement(bool? value) {
    state.agreement.value = value == true;
  }
}
