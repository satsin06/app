import 'package:isar/isar.dart';

part 'authorization_entity.g.dart';

@Collection()
class AuthorizationEntity {
  /// Store ID.
  @Id()
  int? $id;

  /// The token is refresh token.
  @Index(unique: true)
  late bool isRefreshToken;

  late String token;

  late String? payload;

  late DateTime expiredAt;

  late AuthorizationEntity? refresh;
}
