import 'package:hive/hive.dart';

import 'user_profile.dart';

part 'user.g.dart';

@HiveType(typeId: 3)
class User {
  @HiveField(0)
  late String id;

  @HiveField(1)
  String? username;

  @HiveField(2)
  String? phone;

  @HiveField(3)
  UserProfile? profile;
}
