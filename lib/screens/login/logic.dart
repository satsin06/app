import 'dart:async';

import 'package:ferry/ferry.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../graphql/schema.dart' hide DateTime;
import '../../graphql/client.service.dart';
import '../../graphql/mutations.dart';
import 'state.dart';

/// Login logic
class LoginLogic extends GetxController {
  /// The login logic state.
  final LoginState state = LoginState();

  final GraphQLClientService graphql = Get.find<GraphQLClientService>();

  /// Account input text editing controller.
  final TextEditingController accountController = TextEditingController();

  /// Security input text editing controller.
  final TextEditingController securityController = TextEditingController();

  Timer? countdownTimer;

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
    countdownTimer?.cancel();
    countdownTimer = null;
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

  void createSecurityHandler() {
    if (!state.account.value.isPhoneNumber) {
      return Get.snackbar('错误', '请输入正确手机号码');
    }

    state.createSecurityStatus.value = LoginCreateSecurityStatus.INPROGRESS;
    state.countdownNumber.value = 0;
    final createSecurityRequest = GCreatePhoneSecurityReq(
        (builder) => builder..vars.phone = '+86${state.account.value}');
    graphql.clientWithout
        .request(createSecurityRequest)
        .firstWhere((element) => element.dataSource != DataSource.Optimistic)
        .then<DateTime>((response) {
      if (response.data?.createSecurity is DateTime) {
        return response.data!.createSecurity;
      } else if (response.graphqlErrors?.isNotEmpty == true) {
        throw response.graphqlErrors!.last;
      }

      throw response.linkException ?? Exception('服务器错误');
    }).then((value) {
      state.createSecurityStatus.value = LoginCreateSecurityStatus.DONE;
      countdownTimer?.cancel();
      countdownTimer =
          Timer.periodic(Duration(seconds: 1), _$onCountdownTimerCallback);
    }).catchError((error) {
      state.createSecurityStatus.value = LoginCreateSecurityStatus.AWAIT;
      Get.snackbar('错误', '获取验证码失败');
      print(error);
    });
  }

  void _$onCountdownTimerCallback(Timer timer) {
    if (state.countdownNumber < 60) {
      state.countdownNumber.value += 1;
      return;
    }

    countdownTimer?.cancel();
    countdownTimer = null;
    state.createSecurityStatus.value = LoginCreateSecurityStatus.AWAIT;
    timer.cancel();
  }
}
