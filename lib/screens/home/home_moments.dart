// Copyright (c) 2021, Odroe Inc. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:ui';

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
            children: const [
              MomentCard(),
              MomentCard(),
              MomentCard(),
            ],
          ),
          ListView(
            children: const [
              MomentCard(),
              MomentCard(),
              MomentCard(),
            ],
          ),
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
          child: ReadMoreText(
            'Socfony is an open source social application, and basic security modules and social function modules have been preset in the software. Whether it is to deploy Socfony directly or as a basis for program development is wonderful',
            trimMode: TrimMode.Line,
            trimLines: 3,
            trimExpandedText: '收起',
            trimCollapsedText: '阅读全文',
            style: theme.textTheme.bodyText2,
            colorClickableText: theme.primaryColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 64, right: 16, top: 12),
          child: AspectRatio(
            aspectRatio: 3 / 4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: PageView(
                children: [
                  Image.asset(
                    'assets/socfony.png',
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'https://avatars.githubusercontent.com/u/5564821?v=4',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 64, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.shortcut),
                label: const Text('分享'),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.forum),
                label: const Text(
                  '评论',
                  style: TextStyle(
                    fontFeatures: [
                      FontFeature.alternativeFractions(),
                    ],
                  ),
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border),
                label: const Text('喜欢'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
