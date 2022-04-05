import 'package:isar/isar.dart';

part 'authorization.g.dart';

@Collection(accessor: 'authorizations')
class Authorization {
  @Id()
  int? $id;

  @Index(unique: true)
  late String $type;

  late String token;

  late DateTime expiredAt;

  String? payload;
}
