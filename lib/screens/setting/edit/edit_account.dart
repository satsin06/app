import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socfony/widgets/user_avatar.dart';

import '../../../providers/auth.dart';
import '../../../widgets/card_wrapper.dart';
import '../../../widgets/dynamic_app_bar.dart';
import '../../user/widgets/user_refresh_load.dart';
import 'widgets/bio_tile.dart';
import 'widgets/birthday_tile.dart';
import 'widgets/gender_tile.dart';
import 'widgets/change_user_avatar_button.dart';
import 'widgets/username_card.dart';

class EditAccountScreen extends ConsumerWidget {
  const EditAccountScreen({Key? key}) : super(key: key);

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
        const UsernameCard(),
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
    return _CardWrapper.tiles(const [
      BirthdayTile(),
      GenderTile(),
      BioTile(),
    ]);
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