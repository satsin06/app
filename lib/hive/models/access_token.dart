import 'package:hive/hive.dart';

part 'access_token.g.dart';

@HiveType(typeId: 1)
class AccessToken {
  @HiveField(0)
  late String token;

  @HiveField(1)
  late String userId;

  @HiveField(2)
  late DateTime expiredAt;

  @HiveField(3)
  late DateTime refreshExpiredAt;
}
