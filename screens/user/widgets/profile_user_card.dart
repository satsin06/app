import 'package:flutter/material.dart';

import '../controllers/profile_controller.dart';

class ProfileUserCard extends StatelessWidget {
  const ProfileUserCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: const [
        _UserInfoCard(),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: _UserAvatar(),
        ),
      ],
    );
  }
}

class _UserInfoCard extends StatelessWidget {
  const _UserInfoCard({
    Key? key,
  }) : super(key: key);

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
          children: const [
            _UsernameWidget(),
            SizedBox(height: 8),
            _UserBioWidget(),
            SizedBox(height: 12),
            _UserStatisticsWidget(),
            SizedBox(height: 12),
            _AutoSelectPrimaryButton(),
            _AutoSecondaryIconButton(),
          ],
        ),
      ),
    );
  }
}

class _AutoSecondaryIconButton extends StatelessWidget {
  const _AutoSecondaryIconButton({
    Key? key,
  }) : super(key: key);

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

class _AutoSelectPrimaryButton extends StatelessWidget {
  const _AutoSelectPrimaryButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60),
          ),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 64, vertical: 8),
        ),
        elevation: MaterialStateProperty.all(12),
      ),
      onPressed: () {},
      child: const Text('关注'),
    );
  }
}

class _UserStatisticsWidget extends StatelessWidget {
  const _UserStatisticsWidget({
    Key? key,
  }) : super(key: key);

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

class _UserBioWidget extends StatelessWidget {
  const _UserBioWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String? bio =
        UserProfileController.proxy(context).select<String?>((user) {
      return user.profile?.bio;
    });
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

class _UsernameWidget extends StatelessWidget {
  const _UsernameWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String? username =
        UserProfileController.proxy(context).select<String?>((user) {
      return user.username;
    });
    final String userId = UserProfileController.of(context).userId;

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
  const _UserAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: show user avatar.
    // final String? path =
    // UserProfileController.proxy(context).select<dynamic?>((users) {
    //   return users.first.profile?.avatar?.path;
    // });

    return Center(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(36),
        ),
        child: const Padding(
          padding: EdgeInsets.all(2.0),
          child: CircleAvatar(
            radius: 36.0,
          ),
        ),
      ),
    );
  }
}