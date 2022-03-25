import 'package:hive/hive.dart';

import 'file.dart';
import 'user.dart';

part 'user_profile.g.dart';

@HiveType(typeId: 4)
class UserProfile {
  @HiveField(0)
  late String userId;

  @HiveField(1)
  File? abatar;

  @HiveField(2)
  String? bio;

  @HiveField(3)
  int? birthday;

  @HiveField(4)
  late User user;
}
