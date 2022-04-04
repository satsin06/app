import 'dart:convert';

import 'package:isar/isar.dart';

part 'setting.g.dart';

@Collection(accessor: 'settings')
class Setting<T extends Object> {
  @Id()
  int? $id;

  @Index(unique: true)
  late String key;

  late String $origin;

  T get value => json.decode($origin);
  set value(value) => $origin = json.encode(value);
}
