import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../api/api.dart';
import '../../../../providers/api.dart';
import '../../../../providers/user.dart';

final _uploadingProvider = StateProvider.autoDispose((_) => false);
final _errorMessageProvider = StateProvider.autoDispose<String?>((_) => null);

class ChangeUserAvatarButton extends ConsumerWidget {
  const ChangeUserAvatarButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context, ref),
      child: Column(
        children: const [
          _ChangeButton(),
          _ErrorMessage(),
        ],
      ),
    );
  }

  Future<bool> _onWillPop(BuildContext context, WidgetRef ref) async {
    if (ref.read(_uploadingProvider) == false) return true;

    // Opens a dialog telling the user that the avatar is being uploaded and please be patient.
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('正在上传头，请稍后...'),
        content: const LinearProgressIndicator(),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('好的'),
          ),
        ],
      ),
    );

    return false;
  }
}

class _ChangeButton extends ConsumerWidget {
  const _ChangeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.watch(_uploadingProvider)) {
      return TextButton.icon(
        onPressed: null,
        icon: const SizedBox.square(
          dimension: 16,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
        label: const Text('正在上传...'),
      );
    }

    return TextButton(
      onPressed: () => _changeAvatarHandler(context, ref),
      child: const Text('更换头像'),
    );
  }

  void _changeAvatarHandler(BuildContext context, WidgetRef ref) async {
    // Pick an image from the gallery.
    final XFile? file = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
      maxHeight: 9999,
      maxWidth: 9999,
    );

    if (file == null) return;

    try {
      // Set the uploading flag to true,
      // and upload the image.
      ref.read(_uploadingProvider.state).state = true;

      /// Upload avatar and get user.
      final User user =
          await ref.read($APIProvider).user.updateAvatar(File(file.path));

      ref.read($UserProvider(user.id).notifier).update((state) => user);

      // clear error message
      ref.read(_errorMessageProvider.state).state = null;
    } catch (e) {
      // Show the error message.
      ref.read(_errorMessageProvider.state).state =
          e is FormatException ? e.message : e.toString();
    } finally {
      // Set the uploading flag to false,
      ref.read(_uploadingProvider.state).state = false;
    }
  }
}

class _ErrorMessage extends ConsumerWidget {
  const _ErrorMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Error message
    final String? errorMessage = ref.watch(_errorMessageProvider);
    if (errorMessage == null) return const SizedBox.shrink();

    final ThemeData theme = Theme.of(context);
    final TextStyle? errorTextStyle = theme.textTheme.bodySmall?.copyWith(
      color: theme.errorColor,
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(errorMessage, style: errorTextStyle),
    );
  }
}
