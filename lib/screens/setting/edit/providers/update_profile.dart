import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socfony/providers/api.dart';

import '../../../../api/api.dart';
import '../../../../providers/auth.dart';
import '../../../../providers/user.dart';

Future<User> Function({
  String? bio,
  int? birthday,
  UserGender? gender,
}) updateAuthProfile(WidgetRef ref) =>
    ({String? bio, int? birthday, UserGender? gender}) async {
      final User user = await ref.read($APIProvider).user.update(
            bio: bio,
            gender: gender,
            birthday: birthday,
          );

      final String? auth = ref.read($AuthProvider);
      return ref.read($UserProvider(auth!).notifier).update((state) => user);
    };
