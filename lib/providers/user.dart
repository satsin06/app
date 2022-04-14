import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/api.dart';

class InitProviderCreatedUser extends User {
  InitProviderCreatedUser(String id) : super(id: id);
}

final AutoDisposeStateProviderFamily<User, String> $UserProvider =
    StateProvider.autoDispose.family<User, String>(
  (Ref ref, String userId) => InitProviderCreatedUser(userId),
);
