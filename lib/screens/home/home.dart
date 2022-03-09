// Copyright (c) 2021, Odroe Inc. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socfony/widgets/svg_icon.dart';

import 'home_moments.dart';

class HomeScrren extends StatelessWidget {
  const HomeScrren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PageController(),
      child: const _HomeScrren(),
    );
  }
}

class _HomeScrren extends StatelessWidget {
  const _HomeScrren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: SvgIcon.asset('assets/bottom_navigation_bar/home.svg'),
            activeIcon:
                SvgIcon.asset('assets/bottom_navigation_bar/home_selected.svg'),
            label: '动态',
          ),
          // BottomNavigationBarItem(
          //   icon: SvgIcon.asset('assets/bottom_navigation_bar/community.svg'),
          //   activeIcon: SvgIcon.asset(
          //       'assets/bottom_navigation_bar/community_selected.svg'),
          //   label: '社区',
          // ),
          // BottomNavigationBarItem(
          //   icon: SvgIcon.asset('assets/bottom_navigation_bar/message.svg'),
          //   activeIcon: SvgIcon.asset(
          //       'assets/bottom_navigation_bar/message_selected.svg'),
          //   label: '消息',
          // ),
          BottomNavigationBarItem(
            icon: SvgIcon.asset('assets/bottom_navigation_bar/me.svg'),
            activeIcon:
                SvgIcon.asset('assets/bottom_navigation_bar/me_selected.svg'),
            label: '我的',
          ),
        ],
        currentIndex: context.watch<PageController>().positions.isEmpty
            ? 0
            : context.watch<PageController>().page!.round(),
        onTap: (index) => context.read<PageController>().jumpToPage(index),
      ),
      body: PageView(
        controller: context.read<PageController>(),
        children: const [
          HomeMomentsScrren(),
          Text('1'),
        ],
      ),
    );
  }
}
