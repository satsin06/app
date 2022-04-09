import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/storage.dart';
import '../providers/user.dart';

class UserAvatar extends ConsumerWidget {
  const UserAvatar(
    this.userId, {
    Key? key,
    this.radius,
  }) : super(key: key);

  final String userId;
  final double? radius;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? storageId = ref.watch(
      userProfileProvider(userId).select((value) => value.avatarStorageId),
    );
    final Widget defaultWidget = CircleAvatar(
      radius: radius,
      backgroundColor: Theme.of(context).primaryColor,
    );
    if (storageId == null) return defaultWidget;

    return ref.watch(queryStorageDownloadUrl(storageId)).when<Widget>(
          data: (url) => CircleAvatar(
            radius: radius,
            child: ClipRRect(
              child: Image.network(
                url,
                fit: BoxFit.cover,
                width: radius == null ? null : radius! * 2,
                height: radius == null ? null : radius! * 2,
              ),
              borderRadius: BorderRadius.circular(36),
            ),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          error: (_, __) => defaultWidget,
          loading: () => CircleAvatar(
            radius: radius,
            child: const CircularProgressIndicator(),
            backgroundColor: Theme.of(context).primaryColor,
          ),
        );
  }
}
