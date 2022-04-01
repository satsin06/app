import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/states/app_auth.dart';
import '../../provider/states/app_key.dart';
import '../../widgets/dynamic_app_bar.dart';

Widget _titleBuilder(BuildContext context, double opacity) {
  return const Text('设置');
}

class UserSettingScreen extends StatelessWidget {
  const UserSettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DynamicAppBar(
        title: _titleBuilder,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 8,
            ),
            child: Text(
              '账户',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: ListTile.divideTiles(
                context: context,
                tiles: [
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text('账户资料'),
                    onTap: () {
                      Navigator.of(context).pushNamed('/user/edit');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.verified_user),
                    title: const Text('安全设置'),
                    onTap: () {},
                  ),
                ],
              ).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 8,
            ).copyWith(top: 24),
            child: Text(
              '通用',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: ListTile.divideTiles(
                context: context,
                tiles: [
                  ListTile(
                    leading: const Icon(Icons.color_lens),
                    title: const Text('主题颜色'),
                    onTap: () {},
                  ),
                ],
              ).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 8,
            ).copyWith(top: 24),
            child: Text(
              '关于',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: ListTile.divideTiles(
                context: context,
                tiles: [
                  // 用户协议
                  ListTile(
                    leading: const Icon(Icons.description),
                    title: const Text('用户协议'),
                    onTap: () {},
                  ),
                  // 隐私政策
                  ListTile(
                    leading: const Icon(Icons.lock),
                    title: const Text('隐私政策'),
                    onTap: () {},
                  ),
                  // 帮助与反馈
                  ListTile(
                    leading: const Icon(Icons.help),
                    title: const Text('帮助与反馈'),
                    onTap: () {},
                  ),
                  // 关于
                  AboutListTile(
                    icon: const Icon(Icons.info),
                    child: const Text('关于 Socfony'),
                    applicationIcon: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/socfony.png',
                        width: 120,
                        height: 120,
                      ),
                    ),
                    applicationName: 'Socfony',
                    applicationVersion: '1.0.0',
                    applicationLegalese:
                        r'©️ 2022, Odroe Inc. All rights reserved.',
                  ),
                ],
              ).toList(),
            ),
          ),
          // 退出登录
          const SizedBox(height: 36),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                await context.read<AppAuthState>().delete();
                context.read<AppKeyState>().change();
              },
              child: const Text('退出登录'),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                ),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(
                    horizontal: 64,
                    vertical: 12,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
