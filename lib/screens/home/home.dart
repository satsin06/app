// Copyright (c) 2021, Odroe Inc. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

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
      appBar: AppBar(
        centerTitle: false,
        title: TabBar(
          controller: _controller,
          isScrollable: true,
          tabs: const [
            Tab(text: 'Timeline'),
            Tab(text: 'Follow'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: r'搜索',
            onPressed: () {
              // TODO: Jump to search page.
            },
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
          const UserProfileAvatarButton(),
        ],
      ),
      floatingActionButton: const JumpPublishButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: TabBarView(
        controller: _controller,
        children: [
          for (HomeScreenTab tab in HomeScreenTab.values) Text(tab.name),
        ],
      ),
    );
  }
}
