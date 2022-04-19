// Copyright (c) 2021, Odroe Inc. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

import '../../widgets/card_wrapper.dart';
import '../../widgets/dynamic_app_bar.dart';
import '../../widgets/user_avatar.dart';
import 'widgets/jump_publish_button.dart';
import 'widgets/user_profile_avatar_button.dart';

enum HomeScreenTab {
  timeline,
  follow,
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
    required this.tab,
  }) : super(key: key);

  final HomeScreenTab? tab;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin<HomeScreen> {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      initialIndex: HomeScreenTab.timeline.index,
      length: HomeScreenTab.values.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller.index = HomeScreenTab.timeline.index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: false,
      //   title: TabBar(
      //     controller: _controller,
      //     isScrollable: true,
      //     tabs: const [
      //       Tab(text: 'Timeline'),
      //       Tab(text: 'Follow'),
      //     ],
      //   ),
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.search),
      //       tooltip: r'搜索',
      //       onPressed: () {
      //         // TODO: Jump to search page.
      //       },
      //     ),
      //     IconButton(
      //       onPressed: () {},
      //       icon: const Icon(Icons.notifications),
      //     ),
      //     const UserProfileAvatarButton(),
      //   ],
      // ),
      appBar: DynamicAppBar(
        title: (_, __) => TabBar(
          controller: _controller,
          isScrollable: true,
          tabs: const [
            Tab(text: 'Timeline'),
            Tab(text: 'Follow'),
          ],
        ),
        centerTitle: false,
        actions: (_, __) => [
          // IconButton(
          //   icon: const Icon(Icons.search),
          //   tooltip: r'搜索',
          //   onPressed: () {},
          // ),
          // IconButton(
          //   onPressed: () {},
          //   icon: const Icon(Icons.notifications),
          // ),
          const UserProfileAvatarButton(),
        ],
      ),
      floatingActionButton: const JumpPublishButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: TabBarView(
        controller: _controller,
        children: [
          for (HomeScreenTab tab in HomeScreenTab.values) _MomentList(tab),
        ],
      ),
    );
  }
}

class _MomentList extends StatefulWidget {
  const _MomentList(this.tab);

  final HomeScreenTab tab;

  @override
  State<_MomentList> createState() => _MomentListState();
}

class _MomentListState extends State<_MomentList>
    with AutomaticKeepAliveClientMixin<_MomentList> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
      triggerMode: RefreshIndicatorTriggerMode.anywhere,
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 2));
        print(1);
      },
      child: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return CardWrapper(
            margin: const EdgeInsets.only(left: 16, right: 16, top: 8),
            padding: const EdgeInsets.all(16).copyWith(bottom: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const UserAvatar(),
                  title: Text(
                    'Seven',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  subtitle: Text('10 minutes ago',
                      style: Theme.of(context).textTheme.labelMedium),
                  trailing: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Icon(Icons.star_border),
                  ),
                ),
                Text(
                  'Hello, Socfony!',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Row(
                  children: [
                    const Expanded(child: SizedBox.shrink()),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.question_answer_outlined),
                      label: const Text('评论'),
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border),
                      label: const Text('喜欢'),
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
