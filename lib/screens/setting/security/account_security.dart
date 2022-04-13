import 'package:flutter/material.dart';

import '../../../api/api.dart';
import '../../../widgets/dynamic_app_bar.dart';
import 'widgets/account_security_child_card.dart';

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
          const AccountSecurityChildCard(UserSecurityFields.password),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 8,
            ),
            child: Text(
              '电子邮箱',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          const AccountSecurityChildCard(UserSecurityFields.email),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 8,
            ),
            child: Text(
              '手机号码',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          const AccountSecurityChildCard(UserSecurityFields.phone),
        ],
      ),
    );
  }

  Widget titleBuilder(BuildContext context, double opacity) {
    return const Text('账户安全');
  }
}
