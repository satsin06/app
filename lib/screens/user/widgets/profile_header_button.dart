import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../mixins/route_arguments_reader.dart';
import '../../../providers/auth_provider.dart';
import '../../../route/route_names.dart';
import 'profile_header_open_more_button.dart';

class ProfileHeaderButton extends ConsumerWidget
    with RouteArgumentsReader<String> {
  const ProfileHeaderButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? auth = ref.read(authProvider);
    final String userId = getRouteArguments(context);

    if (auth == userId) {
      return IconButton(
        onPressed: () {
          Navigator.of(context).pushNamed(RouteNames.userSetting);
        },
        icon: const Icon(Icons.crop_square),
      );
    }

    return const ProfileHeaderOpenMoreButton();
  }
}
