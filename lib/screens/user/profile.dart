import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/states/app_auth.dart';
import '../../provider/states/app_key.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  String? resolveCurrentUserId(BuildContext context) {
    final Object? currentUserId = ModalRoute.of(context)?.settings.arguments;
    if (currentUserId is String) {
      return currentUserId;
    }

    return context.read<AppAuthState>().userId;
  }

  @override
  Widget build(BuildContext context) {
    print(resolveCurrentUserId(context));
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('User Profile'),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                // context.read<AppAuthState>().delete();
                context.read<AppKeyState>().change();
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('User Profile'),
      ),
    );
  }
}
