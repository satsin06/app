import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/api.dart';
import '../providers/storage.dart';
import '../providers/user.dart';

class UserAvatar extends ConsumerWidget {
  const UserAvatar({
    Key? key,
    this.userId,
    this.radius,
  }) : super(key: key);

  final String? userId;
  final double? radius;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (userId == null || userId!.isEmpty) {
      return _DefaultUserAvatar(radius: radius);
    }

    final String? storageId = ref
        .watch($UserProvider(userId!).select((value) => value.avatarStorageId));
    if (storageId == null) return _DefaultUserAvatar(radius: radius);

    final StorageOptions options = StorageOptions(storageId);
    final storage = ref.watch($StorageProvider(options));

    return storage.when<Widget>(
      data: (storage) => _StorageImageAvatar(radius: radius, storage: storage),
      error: (_, __) => _DefaultUserAvatar(radius: radius),
      loading: () => _LoadingUserAvatar(radius: radius),
    );
  }
}

class _DefaultUserAvatar extends StatelessWidget {
  const _DefaultUserAvatar({Key? key, this.radius}) : super(key: key);

  final double? radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      child: Icon(
        Icons.person,
        color: Theme.of(context).colorScheme.onPrimary,
        size: radius,
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}

class _LoadingUserAvatar extends StatelessWidget {
  const _LoadingUserAvatar({Key? key, this.radius}) : super(key: key);

  final double? radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      child: Stack(
        fit: StackFit.expand,
        children: [
          const CircularProgressIndicator(),
          _DefaultUserAvatar(radius: radius),
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}

class _StorageImageAvatar extends StatelessWidget {
  const _StorageImageAvatar({
    Key? key,
    this.radius,
    required this.storage,
  }) : super(key: key);

  final double? radius;
  final Storage storage;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      child: ClipRRect(
        child: Image.network(
          storage.url,
          fit: BoxFit.cover,
          width: radius != null ? radius! * 2 : null,
          height: radius != null ? radius! * 2 : null,
        ),
        borderRadius: BorderRadius.circular(radius ?? 100),
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
