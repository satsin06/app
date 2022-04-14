import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/user.dart';

class ProfileHeaderTitle extends ConsumerWidget {
  const ProfileHeaderTitle({
    Key? key,
    required this.userId,
  }) : super(key: key);

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = $UserProvider(userId).select((value) => value.username);
    final username = ref.watch(provider);

    return Text(username ?? 'User Profile');
  }
}
