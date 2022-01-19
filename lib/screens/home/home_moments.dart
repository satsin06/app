// Copyright (c) 2021, Odroe Inc. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

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
        children: [
          ListView(
            children: const [MomentCard()],
          ),
          const Text('关注'),
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
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 64,
              child: Center(
                child: CircleAvatar(radius: 21),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Seven',
                    style: theme.textTheme.subtitle2,
                  ),
                  Text(
                    '3天前',
                    style: theme.textTheme.caption,
                  ),
                ],
              ),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: const Icon(Icons.expand_more),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 64, right: 16),
          // child: Text(
          //   '不会随大风过后就是冻干粉黄金时代工会经费把史蒂芬霍金风格黄金时代v发货剪短发',
          //   style: theme.textTheme.bodyText2,
          // ),
          child: ReadMoreText(
            'Socfony is an open source social application, and basic security modules and social function modules have been preset in the software. Whether it is to deploy Socfony directly or as a basis for program development is wonderful',
            trimMode: TrimMode.Line,
            trimLines: 3,
            trimExpandedText: '收起',
            trimCollapsedText: '阅读全文',
            style: theme.textTheme.bodyText2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 64, right: 16),
          // child: Grid,
        ),
      ],
    );
  }
}
