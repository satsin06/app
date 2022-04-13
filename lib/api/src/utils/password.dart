import 'dart:convert';

import 'package:crypto/crypto.dart';

String convertPassword(String password) {
  return sha256.convert(utf8.encode(password)).toString();
}
