import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/states/app_auth.dart';
import '../../provider/states/users.dart';
import '../../widgets/dynamic_app_bar.dart';
import '../../widgets/ghost_screen.dart';
import 'controllers/profile_controller.dart';
import 'graphql/query_profile_user.dart';

class EditUserScreen extends StatelessWidget {
  const EditUserScreen({Key? key}) : super(key: key);

  String? _watchCurrentUserOnAuth(BuildContext context) {
    return context.select<AppAuthState, String?>((state) => state.userId);
  }

  String? _currentUserId(BuildContext context) {
    return context.read<AppAuthState>().userId;
  }

  Future<UserProfileController> _createFuture(BuildContext context) async {
    final userId = _currentUserId(context);
    final user = await queryProfileUser(userId!);

    // Upsert user
    context.read<UsersState>().upsert(
          where: (where) => where.id == user.id,
          create: () => user,
          update: (update) {
            update
              ..username = user.username
              ..profile ??= user.profile
              ..profile?.bio = user.profile?.bio
              ..profile?.avatar = user.profile?.avatar
              ..profile?.birthday = user.profile?.birthday;
          },
        );

    return UserProfileController(user.id);
  }

  @override
  Widget build(BuildContext context) {
    final userId = _watchCurrentUserOnAuth(context);
    if (userId == null) {
      return const GhostScreen();
    }

    return FutureBuilder<UserProfileController>(
      future: _createFuture(context),
      builder: _builder,
    );
  }

  Widget _builder(
      BuildContext context, AsyncSnapshot<UserProfileController> snapshot) {
    if (snapshot.hasError) {
      print(snapshot.error);
      return const GhostScreen();
    }

    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Scaffold(
        appBar: DynamicAppBar(),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return ChangeNotifierProvider.value(
      value: snapshot.data,
      child: const _Screen(),
    );
  }
}

class _Screen extends StatelessWidget {
  const _Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DynamicAppBar(
        title: (_, __) => const Text('账户资料'),
      ),
      body: const _ScreenBody(),
    );
  }
}

class _ScreenBody extends StatelessWidget {
  const _ScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
