import 'dart:async';

import 'package:hive_flutter/hive_flutter.dart';

import 'models/access_token.dart';
import 'models/app_theme.dart';

FutureOr<void> hiveInit() async {
  // Initialize [Hive]
  await Hive.initFlutter('database');

  // Register adapters
  Hive.registerAdapter(AccessTokenAdapter());
  Hive.registerAdapter(AppThemeAdapter());
}
