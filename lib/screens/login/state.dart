import 'package:get/get.dart';
import 'package:socfony/graphql/schema.dart';

enum LoginCreateSecurityStatus {
  AWAIT,
  DONE,
  INPROGRESS,
}

/// Login state
class LoginState {
  /// Login mode.
  final Rx<GUserSecurityCompareType> mode =
      GUserSecurityCompareType.PHONE_SMS_CODE.obs;

  /// Login account.
  final Rx<String> account = ''.obs;

  /// Login security
  ///
  /// If [mode] is [GUserSecurityCompareType.PHONE_SMS_CODE], the security save SMS code.
  ///
  /// If [mode] is [GUserSecurityCompareType.PASSWORD], the security save password.
  final Rx<String> security = ''.obs;

  /// Login agreement value.
  final Rx<bool> agreement = false.obs;

  final Rx<int> countdownNumber = 0.obs;
  final Rx<LoginCreateSecurityStatus> createSecurityStatus =
      LoginCreateSecurityStatus.AWAIT.obs;
}
