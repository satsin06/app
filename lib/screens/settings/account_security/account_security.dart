import 'package:flutter/material.dart';

import '../../../widgets/dynamic_app_bar.dart';

class AccountSecurityScreen extends StatelessWidget {
  const AccountSecurityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DynamicAppBar(
        automaticallyImplyLeading: true,
        title: titleBuilder,
      ),
    );
  }

  Widget titleBuilder(BuildContext context, double opacity) {
    return const Text('账户安全');
  }
}
