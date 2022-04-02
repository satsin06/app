import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/states/app_auth.dart';
import '../../provider/states/users.dart';
import '../../widgets/card_wrapper.dart';
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
    return ListView(
      children: [
        const SizedBox(height: 16),
        const CircleAvatar(
          radius: 36,
        ),
        Center(
          child: TextButton(
            onPressed: () {},
            child: const Text('更换头像'),
          ),
        ),
        const _CardWrapper(child: _AccountUsername()),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 8,
          ).copyWith(top: 24),
          child: Text(
            '资料',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        const _UserDataCard(),
      ],
    );
  }
}

class _UserDataCard extends StatelessWidget {
  const _UserDataCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _CardWrapper.tiles([
      ListTile(
        dense: true,
        title: const Text('生日'),
        trailing: TextButton(
          onPressed: () {},
          child: const Text('2020-01-01'),
        ),
      ),
      ListTile(
        dense: true,
        title: const Text('性别'),
        trailing: TextButton(
          onPressed: () {},
          child: const Text('男'),
        ),
      ),
      const _UserBio(),
    ]);
  }
}

class _UserBio extends StatelessWidget {
  const _UserBio({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String? bio = UserProfileController.proxy(context)
        .select<String?>((user) => user.profile?.bio);

    Widget child;
    if (bio == null || bio.isEmpty) {
      child = const Text('这个人很懒，什么都没有留下。');
    } else {
      child = Text(bio);
    }

    return ListTile(
      title: Text('简介', style: Theme.of(context).textTheme.bodyMedium),
      subtitle: child,
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.chevron_right),
      ),
    );
  }
}

class _AccountUsername extends StatelessWidget {
  const _AccountUsername({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String? username =
        UserProfileController.proxy(context).select<String?>(
      (user) => user.username,
    );

    Widget? child;
    if (username == null) {
      child = const Text('设置用户名');
    }

    return ListTile(
      title: _LabelRow(
        labelText: '用户名',
        text: username,
        child: child,
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.edit),
      ),
    );
  }
}

class _CardWrapper extends StatelessWidget {
  factory _CardWrapper.tiles(Iterable<Widget> tiles) {
    final List<Widget> widgets = [];

    // 每一个 tile 后插入一个分割线，除了最后一个 tile
    for (var i = 0; i < tiles.length; i++) {
      widgets.add(tiles.elementAt(i));
      if (i != tiles.length - 1) {
        widgets.add(const Divider(indent: 60));
      }
    }

    return _CardWrapper(child: Column(children: widgets));
  }

  const _CardWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CardWrapper(
      child: child,
    );
  }
}

class _LabelRow extends StatelessWidget {
  const _LabelRow({
    Key? key,
    this.label,
    this.child,
    this.labelText,
    this.text,
  }) : super(key: key);

  final String? labelText;
  final String? text;
  final Widget? label;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final Widget labelWidget = label ??
        Text(
          labelText!,
          style: Theme.of(context).textTheme.bodyMedium,
        );
    final Widget textWidget = child ??
        Text(
          text!,
          style: Theme.of(context).textTheme.bodyLarge,
        );

    return Row(
      children: [
        SizedBox(
          width: 60,
          child: labelWidget,
        ),
        Expanded(
          child: textWidget,
        ),
      ],
    );
  }
}
