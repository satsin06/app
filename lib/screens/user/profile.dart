import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/states/app_auth.dart';
import '../../route/route_names.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  String? resolveCurrentUserId(BuildContext context) {
    final Object? currentUserId = ModalRoute.of(context)?.settings.arguments;
    if (currentUserId is String) {
      return currentUserId;
    }

    return currentAuthenticatedUserId(context);
  }

  String? currentAuthenticatedUserId(BuildContext context) {
    return context.read<AppAuthState>().userId;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('socfony'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RouteNames.setting);
              },
              icon: const Icon(Icons.crop_square),
            )
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: headerSliverBuilder,
          body: TabBarView(
            children: [
              SafeArea(
                top: false,
                child: ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index) => ListTile(
                    title: Text('Item $index'),
                  ),
                ),
              ),
              const Text('Likes'),
              const Text('Comments'),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> headerSliverBuilder(
      BuildContext context, bool innerBoxIsScrolled) {
    return <Widget>[
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 36,
              ),
              const Expanded(child: SizedBox.shrink()),
              OutlinedButton(
                onPressed: () {},
                child: const Text('发消息'),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('关注'),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 8),
          child: Text(
            'Socfony',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 4),
          child: Text(
            'Socfony is an open source social application, and basic security modules and social function modules have been preset in the software. Whether it is to deploy Socfony directly or as a basis for program development is wonderful.',
            style: Theme.of(context).textTheme.bodyMedium,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      const SliverToBoxAdapter(
        child: ListTile(
          dense: true,
          leading: Icon(Icons.cake),
          minLeadingWidth: 0,
          title: Text('1993年11月2日'),
        ),
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    '0',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    '获得喜欢',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    '0',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    '关注',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    '0',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    '粉丝',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      const SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 6),
          child: Divider(),
        ),
      ),
      SliverPersistentHeader(
        pinned: true,
        floating: true,
        delegate: _SliverTabBarDelegate(
          const TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(text: '动态'),
              Tab(text: '喜欢'),
              Tab(text: '评论'),
            ],
          ),
        ),
      ),
    ];
  }
}

class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverTabBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverTabBarDelegate oldDelegate) {
    return false;
  }
}
