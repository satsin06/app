import 'package:hive/hive.dart';

import '../../hive/hive.dart';
import '../constants.dart';

class AuthBox {
  static const String key = authHeaderKey;
  static Future<Box<AccessToken>> get box =>
      getHiveBox<AccessToken>(authHeaderKey);

  static Future<AccessToken?> get() async => (await box).get(authHeaderKey);
  static Future<void> set(AccessToken accessToken) async =>
      (await box).put(authHeaderKey, accessToken);
  static Future<void> delete() async => (await box).delete(authHeaderKey);
}
