import 'dart:convert';

import 'package:crypto/crypto.dart';

abstract class Password {
  static String hash(String password) {
    return sha256.convert(utf8.encode(password)).toString();
  }
}
