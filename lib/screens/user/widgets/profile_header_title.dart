import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../mixins/route_arguments_reader.dart';
import '../../../providers/user_provider.dart';

final _usernameProvider = Provider.autoDispose.family<String?, String>(
  (ref, userId) {
    final provider = userProvider(userId);
    final user = ref.watch(provider);

    return user.username;
  },
);

class ProfileHeaderTitle extends ConsumerWidget
    with RouteArgumentsReader<String> {
  const ProfileHeaderTitle({
    Key? key,
    required this.userId,
  }) : super(key: key);

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = getRouteArguments(context);
    final provider = _usernameProvider(userId);
    final username = ref.watch(provider);

    return Text(username ?? 'User Profile');
  }
}
