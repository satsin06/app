import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../hive/models/user.dart';
import '../../provider/states/users.dart';
import '../../widgets/dynamic_app_bar.dart';
import '../../widgets/ghost_screen.dart';
import 'controllers/profile_controller.dart';
import 'graphql/query_profile_user.dart';
import 'widgets/profile_header_button.dart';
import 'widgets/profile_user_card.dart';

List<Widget> _appBarActionsBuilder(BuildContext context, double opacity) {
  return const <Widget>[ProfileHeaderButton()];
}

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  String? resolveUserId(BuildContext context) {
    final Object? currentUserId = ModalRoute.of(context)?.settings.arguments;
    if (currentUserId is String) {
      return currentUserId;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final String? userId = resolveUserId(context);

    if (userId == null) {
      return const GhostScreen();
    }

    return FutureBuilder<UserProfileController>(
      builder: _builder,
      initialData: _initialData(context, userId),
      future: _createFuture(context, userId),
    );
  }

  UserProfileController? _initialData(BuildContext context, String userId) {
    final bool exists = context.read<UsersState>().exists(
          where: (User user) => user.id == userId,
        );
    if (exists) {
      return UserProfileController(userId);
    }

    return null;
  }

  Future<UserProfileController> _createFuture(
      BuildContext context, String userId) async {
    final User user = await queryProfileUser(userId);
    final UserProfileController controller = UserProfileController(user.id);
    final UsersState state = context.read<UsersState>();

    state.upsert(
      where: (User where) => where.id == user.id,
      create: () => user,
      update: (User update) {
        update
          ..username = user.username
          ..profile ??= user.profile
          ..profile?.bio = user.profile?.bio
          ..profile?.avatar ??= user.profile?.avatar;
      },
    );

    return controller;
  }

  Widget _builder(
      BuildContext context, AsyncSnapshot<UserProfileController> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Scaffold(
        appBar: DynamicAppBar(),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (snapshot.hasError) {
      return const GhostScreen();
    }

    if (!snapshot.hasData) {
      return const GhostScreen();
    }

    return _ScreenScaffold(controller: snapshot.requireData);
  }
}

class _ScreenScaffold extends StatelessWidget {
  const _ScreenScaffold({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final UserProfileController controller;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserProfileController>.value(
      value: controller,
      child: const Scaffold(
        extendBodyBehindAppBar: true,
        appBar: DynamicAppBar(
          automaticallyImplyLeading: true,
          actions: _appBarActionsBuilder,
        ),
        body: _ScreenBody(),
      ),
    );
  }
}

class _ScreenBody extends StatelessWidget {
  const _ScreenBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        _ScreenBackground(),
        SafeArea(
          top: true,
          left: false,
          right: false,
          bottom: false,
          child: _ScreenContent(),
        ),
      ],
    );
  }
}

class _ScreenBackground extends StatelessWidget {
  const _ScreenBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final ThemeData theme = Theme.of(context);

    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(mediaQuery.size.width),
      ),
      child: Container(
        height: mediaQuery.size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: <Color>[
              theme.backgroundColor,
              theme.primaryColor,
            ],
          ),
        ),
      ),
    );
  }
}

class _ScreenContent extends StatelessWidget {
  const _ScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: ProfileUserCard(),
        ),
      ],
    );
  }
}
