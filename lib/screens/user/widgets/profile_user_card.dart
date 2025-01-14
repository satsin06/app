import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/user.dart';
import '../../../widgets/user_avatar.dart';
import 'profile_card/primary_auto_switch_button.dart';

class ProfileUserCard extends StatelessWidget {
  const ProfileUserCard(
    this.userId, {
    Key? key,
  }) : super(key: key);

  final String userId;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        _UserInfoCard(userId),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: _UserAvatar(userId),
        ),
      ],
    );
  }
}

class _UserInfoCard extends StatelessWidget {
  const _UserInfoCard(
    this.userId, {
    Key? key,
  }) : super(key: key);

  final String userId;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 24).copyWith(top: 36),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24)
            .copyWith(top: 42),
        child: Column(
          children: [
            _UsernameWidget(userId),
            const SizedBox(height: 8),
            _UserBioWidget(userId),
            const SizedBox(height: 12),
            _UserStatisticsWidget(userId),
            const SizedBox(height: 12),
            PrimaryAuthSwitchButton(userId),
            _AutoSecondaryIconButton(userId),
          ],
        ),
      ),
    );
  }
}

class _AutoSecondaryIconButton extends StatelessWidget {
  const _AutoSecondaryIconButton(
    this.userId, {
    Key? key,
  }) : super(key: key);

  final String userId;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(60),
      ),
      elevation: 12,
      margin: const EdgeInsets.only(top: 12),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Icon(
          Icons.near_me,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}

class _UserStatisticsWidget extends StatelessWidget {
  const _UserStatisticsWidget(
    this.userId, {
    Key? key,
  }) : super(key: key);

  final String userId;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text(
              '0',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 4),
            Text(
              '获赞',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        const SizedBox(
          height: 18,
          width: 1,
          child: Divider(thickness: 18),
        ),
        Column(
          children: [
            Text(
              '0',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 4),
            Text(
              '粉丝',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        const SizedBox(
          height: 18,
          width: 1,
          child: Divider(thickness: 18),
        ),
        Column(
          children: [
            Text(
              '0',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 4),
            Text(
              '关注',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ],
    );
  }
}

class _UserBioWidget extends ConsumerWidget {
  const _UserBioWidget(
    this.userId, {
    Key? key,
  }) : super(key: key);

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? bio =
        ref.watch($UserProvider(userId).select((value) => value.bio));
    final String bioText =
        bio != null && bio.isNotEmpty ? bio : '这个人很懒，什么都没有留下~';

    return Text(
      bioText,
      style: Theme.of(context).textTheme.bodySmall,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
    );
  }
}

class _UsernameWidget extends ConsumerWidget {
  const _UsernameWidget(
    this.userId, {
    Key? key,
  }) : super(key: key);

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? username =
        ref.watch($UserProvider(userId).select((value) => value.username));

    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: Text(
        username ?? userId,
        style: Theme.of(context).textTheme.titleLarge,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class _UserAvatar extends StatelessWidget {
  const _UserAvatar(
    this.userId, {
    Key? key,
  }) : super(key: key);

  final String userId;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(36),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: UserAvatar(userId: userId, radius: 36),
        ),
      ),
    );
  }
}
