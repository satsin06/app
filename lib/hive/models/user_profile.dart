import 'package:hive/hive.dart';

import 'file.dart';

part 'user_profile.g.dart';

@HiveType(typeId: 4)
class UserProfile {
  @HiveField(0)
  late String userId;

  @HiveField(1)
  File? avatar;

  @HiveField(2)
  String? bio;

  @HiveField(3)
  int? birthday;
}
