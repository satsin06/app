import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/profile_controller.dart';
import 'widgets/profile_app_bar.dart';
import 'widgets/profile_user_card.dart';

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
      return const Center(
        child: Text('No user id provided'),
      );
    }

    return ChangeNotifierProvider(
      create: (_) => UserProfileController(userId),
      child: const Scaffold(
        extendBodyBehindAppBar: true,
        appBar: ProfileAppBar(),
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
        _ScreenContent(),
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
    return ListView(
      children: const [
        ProfileUserCard(),
      ],
    );
  }
}
