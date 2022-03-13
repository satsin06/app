import 'package:hive/hive.dart';

import '../../hive/hive.dart';
import '../constants.dart';

class AuthBox {
  static Future<Box<AccessToken>> get box async {
    if (Hive.isBoxOpen(authHeaderKey)) {
      return Hive.box(authHeaderKey);
    }

    return Hive.openBox<AccessToken>(authHeaderKey);
  }

  static Future<AccessToken?> get() async => (await box).get(authHeaderKey);
  static Future<void> set(AccessToken accessToken) async =>
      (await box).put(authHeaderKey, accessToken);
  static Future<void> delete() async => (await box).delete(authHeaderKey);
}
