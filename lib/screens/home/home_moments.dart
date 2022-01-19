// Copyright (c) 2021, Odroe Inc. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeMomentsScrren extends StatefulWidget {
  const HomeMomentsScrren({Key? key}) : super(key: key);

  @override
  _HomeMomentsScrrenState createState() => _HomeMomentsScrrenState();
}

class _HomeMomentsScrrenState extends State<HomeMomentsScrren>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return ChangeNotifierProvider.value(
      value: tabController,
      child: const _HomeMomentsScrren(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _HomeMomentsScrren extends StatelessWidget {
  const _HomeMomentsScrren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: TabBar(
          controller: context.read<TabController>(),
          isScrollable: true,
          tabs: const [
            Tab(text: '全部'),
            Tab(text: '关注'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.queue),
            onPressed: () {},
          ),
        ],
      ),
      body: TabBarView(
        controller: context.read<TabController>(),
        children: const [
          MomentCard(),
          Text('关注'),
        ],
      ),
    );
  }
}

class MomentCard extends StatelessWidget {
  const MomentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
                r'https://avatars.githubusercontent.com/u/5564821?v=4'),
          ),
          title: Text('Seven'),
          subtitle: Text('@seven · 1小时前'),
          trailing: Icon(Icons.expand_more),
        ),
        Padding(
          padding: EdgeInsets.only(left: 12),
          child: Text('我的干饭日常'),
        ),
      ],
    );
  }
}
