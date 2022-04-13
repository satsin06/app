import 'package:flutter/material.dart';

import '../../../widgets/card_wrapper.dart';
import '../../../widgets/dynamic_app_bar.dart';
import 'widgets/email_card.dart';
import 'widgets/password_card.dart';

class AccountSecurityScreen extends StatelessWidget {
  const AccountSecurityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DynamicAppBar(
        automaticallyImplyLeading: true,
        title: titleBuilder,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 24),
          const PasswordCard(),
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
          const EmailCard(),
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
              leading: const Icon(Icons.smartphone),
              title: const Text('+8617*******34'),
              trailing: TextButton(onPressed: () {}, child: const Text('更换')),
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
