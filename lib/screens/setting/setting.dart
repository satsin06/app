import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/auth.dart';
import '../../widgets/card_wrapper.dart';
import '../../widgets/dynamic_app_bar.dart';
import '../../router/route_names.dart' as route_names;

Widget _titleBuilder(BuildContext context, double opacity) {
  return const Text('设置');
}

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const DynamicAppBar(
        title: _titleBuilder,
      ),
      body: ListView(
        children: [
          const CardExternalTitle('账户'),
          CardWrapper(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('编辑资料'),
                  onTap: () =>
                      context.pushNamed(route_names.settingEditAccount),
                ),
                const Divider(height: 0, indent: 24),
                ListTile(
                  leading: const Icon(Icons.verified_user),
                  title: const Text('账户安全'),
                  onTap: () => context.pushNamed(route_names.settingSecurity),
                ),
              ],
            ),
          ),

          const CardExternalTitle('账户'),
          CardWrapper(
            child: ListTile(
              leading: const Icon(Icons.color_lens),
              title: const Text('显示与色彩'),
              onTap: () => context.pushNamed(route_names.settingTheme),
            ),
          ),

          const CardExternalTitle('关于'),
          CardWrapper(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.description),
                  title: const Text('用户协议'),
                  onTap: () => context.pushNamed(route_names.settingSecurity),
                ),
                const Divider(height: 0, indent: 24),
                ListTile(
                  leading: const Icon(Icons.lock),
                  title: const Text('隐私政策'),
                  onTap: () => context.pushNamed(route_names.settingSecurity),
                ),
                const Divider(height: 0, indent: 24),
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
            ),
          ),

          // 退出登录
          const SizedBox(height: 36),
          const _LogoutButton()
        ],
      ),
    );
  }
}

class _LogoutButton extends ConsumerWidget {
  const _LogoutButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: ElevatedButton(
        onPressed: _createLogoutHandler(context, ref),
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
    );
  }

  VoidCallback _createLogoutHandler(BuildContext context, WidgetRef ref) {
    return () {
      context.goNamed(route_names.homeTimeline);
      ref.read($AuthProvider.notifier).logout();
    };
  }
}
