import 'package:flutter/material.dart';

import '../../widgets/dynamic_app_bar.dart';
import 'widgets/profile_header_button.dart';
import 'widgets/profile_user_card.dart';
import 'widgets/user_refresh_load.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key, required this.userId}) : super(key: key);

  final String userId;

  @override
  Widget build(BuildContext context) {
    return UserRefreshLoad(
      userId: userId,
      builder: _builder,
    );
  }

  Widget _builder(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _appBarBuilder(context),
      body: _bodyBuilder(context),
    );
  }

  PreferredSizeWidget _appBarBuilder(BuildContext context) {
    return DynamicAppBar(
      automaticallyImplyLeading: true,
      actions: _appBarActionsBuilder,
    );
  }

  List<Widget> _appBarActionsBuilder(BuildContext context, double opacity) {
    return <Widget>[ProfileHeaderButton(userId)];
  }

  Widget _bodyBuilder(BuildContext context) {
    return _ProfileScreenBackguardWrapper(
      child: CustomScrollView(
        slivers: _bodySliversBuilder(context),
      ),
    );
  }

  List<Widget> _bodySliversBuilder(BuildContext context) {
    return <Widget>[
      SliverToBoxAdapter(
        child: ProfileUserCard(userId),
      ),
    ];
  }
}

class _ProfileScreenBackguardWrapper extends StatelessWidget {
  const _ProfileScreenBackguardWrapper({Key? key, this.child})
      : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _backguardBuilder(context),
        _safeAreaChildBuilder(context),
      ],
    );
  }

  Widget _safeAreaChildBuilder(BuildContext context) {
    return SafeArea(
      top: true,
      left: false,
      right: false,
      bottom: false,
      child: child ?? const SizedBox.shrink(),
    );
  }

  Widget _backguardBuilder(BuildContext context) {
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
