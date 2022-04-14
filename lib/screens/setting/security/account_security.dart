import 'package:flutter/material.dart';

import '../../../api/api.dart';
import '../../../widgets/card_wrapper.dart';
import '../../../widgets/dynamic_app_bar.dart';
import 'widgets/account_security_child_card.dart';

class AccountSecurityScreen extends StatelessWidget {
  const AccountSecurityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: DynamicAppBar(
        automaticallyImplyLeading: true,
        title: titleBuilder,
      ),
      body: ListView(
        children: const [
          SizedBox(height: 24),
          AccountSecurityChildCard(UserSecurityFields.password),
          CardExternalTitle('电子邮箱'),
          AccountSecurityChildCard(UserSecurityFields.email),
          CardExternalTitle('手机号码'),
          AccountSecurityChildCard(UserSecurityFields.phone),
        ],
      ),
    );
  }

  Widget titleBuilder(BuildContext context, double opacity) {
    return const Text('账户安全');
  }
}
