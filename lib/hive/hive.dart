export './models/access_token.dart';

import 'package:hive/hive.dart';

Future<Box<T>> getHiveBox<T>(String name) async {
  if (Hive.isBoxOpen(name) != true) {
    return Hive.openBox<T>(name);
  }

  return Hive.box<T>(name);
}
