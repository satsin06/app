import 'package:flutter/material.dart';
import '../../mixins/route_arguments_reader.dart';
import '../../widgets/dynamic_app_bar.dart';
import '../../widgets/ghost_screen.dart';
import 'widgets/profile_header_button.dart';
import 'widgets/profile_user_card.dart';
import 'widgets/user_refresh_load.dart';

List<Widget> _appBarActionsBuilder(BuildContext context, double opacity) {
  return const <Widget>[ProfileHeaderButton()];
}

class UserProfileScreen extends StatelessWidget
    with RouteArgumentsReader<String> {
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
    final String? userId = getRouteArguments(context);

    if (userId == null) {
      return const GhostScreen();
    }

    return UserRefreshLoad(
      userId: userId,
      builder: (_) => const _ScreenScaffold(),
    );
  }
}

class _ScreenScaffold extends StatelessWidget {
  const _ScreenScaffold({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBodyBehindAppBar: true,
      appBar: DynamicAppBar(
        automaticallyImplyLeading: true,
        actions: _appBarActionsBuilder,
      ),
      body: _ScreenBody(),
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
