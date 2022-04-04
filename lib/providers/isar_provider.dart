import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../authorization_manager/authorization_manager.dart';
import '../models/setting.dart';
import '../models/user.dart';

FutureOr<Isar> _create(Ref ref) async {
  final supportDirectory = await getApplicationSupportDirectory();

  return await Isar.open(
    schemas: [
      AuthorizationSchema,
      UserSchema,
      SettingSchema,
    ],
    directory: supportDirectory.path,
    name: r'Socfony Support',
  );
}

final FutureProvider<Isar> isarProvider = FutureProvider<Isar>(_create);
