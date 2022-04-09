import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socfony/widgets/user_avatar.dart';

import '../../../providers/auth.dart';
import '../../../providers/user.dart';
import '../../../widgets/card_wrapper.dart';
import '../../../widgets/dynamic_app_bar.dart';
import '../../user/widgets/user_refresh_load.dart';
import 'widgets/change_user_avatar_button.dart';

class EditUserScreen extends ConsumerWidget {
  const EditUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String userId = ref.read(authProvider)!;

    return UserRefreshLoad(
      userId: userId,
      builder: (_) => const _ScreenScaffold(),
    );
  }
}

class _ScreenScaffold extends StatelessWidget {
  const _ScreenScaffold({Key? key}) : super(key: key);

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
        const _UserAvatar(),
        const ChangeUserAvatarButton(),
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

class _UserAvatar extends ConsumerWidget {
  const _UserAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String userId = ref.watch(authProvider)!;

    return UserAvatar(userId, radius: 36);
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

class _UserBio extends ConsumerWidget {
  const _UserBio({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String userId = ref.read(authProvider)!;
    final privider =
        userProfileProvider(userId).select((profile) => profile.bio);
    final String? bio = ref.watch(privider);

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

class _AccountUsername extends ConsumerWidget {
  const _AccountUsername({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String userId = ref.read(authProvider)!;
    final privider = userProvider(userId);
    final String? username = ref.watch(privider).username;

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
