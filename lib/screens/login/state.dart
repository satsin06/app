import 'package:get/get.dart';
import 'package:socfony/graphql/schema.dart';

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
}
