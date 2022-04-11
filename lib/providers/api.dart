import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socfony/api/api.dart';

import '../configure.dart';
import 'auth.dart';

final apiProvider = Provider(
  (ref) {
    final AuthNotifier authNotifier = ref.watch(authProvider.notifier);

    return API(
      endpoint: Uri.parse(graphqlApiUrl),
      auth: Authentication(authNotifier.authorizationTokenReader),
    );
  },
);
