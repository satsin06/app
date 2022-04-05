import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/user_provider.dart';
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
    final provider = refreshUserProvider(userId);
    return ref.watch(provider).when<Widget>(
          data: (_) => builder(context),
          error: _errorBuilder,
          loading: _loadingBuilder,
        );
  }

  Widget _errorBuilder(Object object, StackTrace? stack) {
    return const GhostScreen();
  }

  Widget _loadingBuilder() {
    return const Scaffold(
      appBar: DynamicAppBar(),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
