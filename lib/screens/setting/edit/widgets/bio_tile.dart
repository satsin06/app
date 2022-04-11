import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/user_profile.dart';
import '../../../../providers/auth.dart';
import '../../../../providers/user.dart';
import '../providers/update_profile.dart';

class BioTile extends ConsumerWidget {
  const BioTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String userId = ref.read(authProvider)!;
    final privider =
        userProfileProvider(userId).select((profile) => profile.bio);
    final String? bio = ref.watch(privider);

    Widget child;
    if (bio == null || bio.isEmpty) {
      child = const Text('这个人很懒，什么都没有留下。');
    } else {
      child = Text(bio);
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ListTile(
        title: Text('简介', style: Theme.of(context).textTheme.bodyMedium),
        subtitle: child,
        trailing: const _EditBioButton(),
      ),
    );
  }
}

class _EditBioButton extends StatelessWidget {
  const _EditBioButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.chevron_right),
      onPressed: () => showEditBioDialog(context),
    );
  }

  void showEditBioDialog(BuildContext context) {
    showDialog(context: context, builder: _EditBioDialog.builder);
  }
}

class _EditBioDialog extends ConsumerWidget {
  final BuildContext context;

  _EditBioDialog.builder(this.context);

  final AutoDisposeChangeNotifierProvider<TextEditingController>
      controllerProvider = ChangeNotifierProvider.autoDispose((Ref ref) {
    final String userId = ref.read(authProvider)!;
    final UserProfile profile = ref.read(userProfileProvider(userId));

    return TextEditingController(text: profile.bio);
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController controller = ref.watch(controllerProvider);
    VoidCallback? onPressed;
    if (controller.text.trim().isNotEmpty) {
      onPressed = () => onChangeBio(context, ref);
    }

    return AlertDialog(
      content: TextField(
        autofocus: true,
        controller: controller,
        decoration: const InputDecoration(
          label: Text('简介'),
          hintText: '请简单的介绍下自己吧',
        ),
        maxLength: 200,
        maxLines: 6,
        minLines: 1,
      ),
      actions: [
        TextButton(
          child: const Text('取消'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        ElevatedButton(
          child: const Text('确定'),
          onPressed: onPressed,
        ),
      ],
    );
  }

  void onChangeBio(BuildContext context, WidgetRef ref) async {
    final String bio = ref.read(controllerProvider).text.trim();
    if (bio.isEmpty) return;

    final Future<UserProfile> Function(
        {String? bio,
        int? birthday,
        UserGender? gender}) updater = updateAuthProfile(ref);
    await updater(bio: bio);
    Navigator.of(context).pop();
  }
}
