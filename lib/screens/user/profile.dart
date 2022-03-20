import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/states/app_auth.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  String? resolveCurrentUserId(BuildContext context) {
    final Object? currentUserId = ModalRoute.of(context)?.settings.arguments;
    if (currentUserId is String) {
      return currentUserId;
    }

    return context.read<AppAuthState>().userId;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(
                    'User Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  background: Image.network(
                    'https://picsum.photos/250?image=9',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              new SliverPersistentHeader(
                delegate: new SliverTabBarDelegate(
                  new TabBar(
                    tabs: [
                      new Tab(text: 'Timeline'),
                      new Tab(text: 'Follow'),
                      new Tab(text: 'Follower'),
                    ],
                  ),
                  color: Colors.white,
                ),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: [
              Center(
                child: Text('Timeline'),
              ),
              Center(
                child: Text('Follow'),
              ),
              Center(
                child: Text('Follower'),
              ),
            ],
          ),
        ),
      ),
    );
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: true,
            leading: BackButton(),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Hero(
                  tag: 'currentUserAvatar',
                  child: CircleAvatar(
                    radius: 42,
                    backgroundColor: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Socfony',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: Column(
                  children: [
                    Text(
                      'Socfony is an open source social application, and basic security modules and social function modules have been preset in the software. Whether it is to deploy Socfony directly or as a basis for program development is wonderful.',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              '1314',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text(
                              '动态',
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '1314',
                              style: Theme.of(context).textTheme.bodyLarge,
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
                              '1314',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text(
                              '喜欢',
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.chat),
                          label: const Text('私信'),
                        ),
                        Expanded(
                          child: ElevatedButton.icon(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                              ),
                              elevation: MaterialStateProperty.all(6),
                            ),
                            onPressed: () {},
                            label: const Text('关注'),
                            icon: const Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar widget;
  final Color color;

  const SliverTabBarDelegate(this.widget, {required this.color})
      : assert(widget != null);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: widget,
      color: color,
    );
  }

  @override
  bool shouldRebuild(SliverTabBarDelegate oldDelegate) {
    return false;
  }

  @override
  double get maxExtent => widget.preferredSize.height;

  @override
  double get minExtent => widget.preferredSize.height;
}
