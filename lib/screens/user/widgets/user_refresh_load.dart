import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../api/api.dart';
import '../../../providers/api.dart';
import '../../../providers/user.dart';
import '../../../widgets/dynamic_app_bar.dart';
import '../../../widgets/ghost_screen.dart';

class UserRefreshLoad extends ConsumerWidget {
  const UserRefreshLoad({
    Key? key,
    required this.builder,
    required this.userId,
  }) : super(key: key);

  final WidgetBuilder builder;
  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<User>(
      builder: _futureWidgetBuilder,
      future: _createFuture(ref),
      initialData: ref.read($UserProvider(userId)),
    );
  }

  Future<User> _createFuture(WidgetRef ref) async {
    final notifier = ref.read($UserProvider(userId).notifier);
    final service = ref.read($APIProvider).user;

    final User user = await service.findUnique(
      UserWhereUniqueInput.id(userId),
    );

    return notifier.update((state) => user);
  }

  Widget _futureWidgetBuilder(
      BuildContext context, AsyncSnapshot<User> snapshot) {
    /// If data is InitProviderCreatedUser, it means that the user is not
    /// found.
    if (snapshot.data is InitProviderCreatedUser &&
        snapshot.connectionState == ConnectionState.waiting) {
      return const Scaffold(
        appBar: DynamicAppBar(),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    /// If the user is not found, show a ghost screen.
    if (snapshot.hasError) return const GhostScreen();

    /// Build next widget.
    return builder(context);
  }
}
