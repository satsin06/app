import 'package:isar/isar.dart';

import 'authorization_type.dart';

part 'authorization.g.dart';

@Collection()
class Authorization {
  @Id()
  int? $id;

  @AuthorizationTypeConverter()
  @Index(unique: true)
  late AuthorizationType $type;

  @Index(unique: true)
  late String token;

  late DateTime expiredAt;

  String? payload;
}
