import 'package:flutter/foundation.dart';

class UserProfileController with ChangeNotifier {
  UserProfileController(this.userId);

  final String userId;
}
