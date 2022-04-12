import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socfony/api/api.dart';

import '../configure.dart';
import 'authorization_manager.dart';

AuthenticationTokenReader _createAuthorizationTokenReader(Ref ref) {
  return () async {
    final manager = await ref.read(authorizationManagerProvider.future);
    final access = await manager.getAccessToken();

    return access?.token;
  };
}

final apiProvider = Provider(
  (ref) => API(
    endpoint: Uri.parse(graphqlApiUrl),
    auth: Authentication(_createAuthorizationTokenReader(ref)),
  ),
);
