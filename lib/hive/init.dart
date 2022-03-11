import 'dart:async';

import 'package:hive_flutter/hive_flutter.dart';

import 'models/access_token.dart';

FutureOr<void> hiveInit() async {
  Hive.initFlutter('database');
  Hive.registerAdapter(AccessTokenAdapter());
}
