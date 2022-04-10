import 'package:flutter/material.dart';

import '../../../widgets/card_wrapper.dart';
import '../../../widgets/dynamic_app_bar.dart';
import 'widgets/password_card.dart';

class AccountSecurityScreen extends StatelessWidget {
  const AccountSecurityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle? buttonStyle = theme.textTheme.button?.copyWith(
      color: theme.primaryColor,
    );

    return Scaffold(
      appBar: DynamicAppBar(
        automaticallyImplyLeading: true,
        title: titleBuilder,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 24),
          const PasswordCard(),
          // GestureDetector(
          //   child: CardWrapper(
          //     padding: const EdgeInsets.symmetric(vertical: 12),
          //     child: Center(
          //       child: Text('更改密码', style: buttonStyle),
          //     ),
          //   ),
          // ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 8,
            ),
            child: Text(
              '电子邮箱',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const CardWrapper(
            child: ListTile(
              leading: Icon(Icons.email),
              title: Text('s******u@outlook.com'),
              trailing: Icon(Icons.chevron_right),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 8,
            ),
            child: Text(
              '手机号码',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          CardWrapper(
            child: ListTile(
              leading: Icon(Icons.smartphone),
              title: Text('+8617*******34'),
              trailing: TextButton(onPressed: () {}, child: Text('更换')),
            ),
          ),
        ],
      ),
    );
  }

  Widget titleBuilder(BuildContext context, double opacity) {
    return const Text('账户安全');
  }
}
