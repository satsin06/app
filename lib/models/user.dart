import 'package:isar/isar.dart';

part 'user.g.dart';

@Collection(accessor: 'users')
class User {
  @Id()
  int? $storeId;

  @Index(unique: true)
  late String id;

  @Index(unique: true)
  String? email;

  @Index(unique: true)
  String? phone;

  @Index(unique: true)
  String? username;
}
