import 'dart:async';

import '../../hive/hive.dart';
import 'auth_box.dart';
import 'refresh_access_token.dart';

/// Get the [AccessToken] from cached.
FutureOr<AccessToken?> getCachedAccessToken() async => await AuthBox.get();

/// Get the [AccessToken] from cached.
///
/// If the [AccessToken] is expired, it will refresh the [AccessToken].
FutureOr<AccessToken?> getAccessTokenWithRefresh() async {
  final AccessToken? accessToken = await getCachedAccessToken();

  if (accessToken != null &&
      accessToken.expiredAt.difference(DateTime.now()).inMinutes < 5) {
    final newAccessToken = await refreshAccessToken();
    if (newAccessToken is AccessToken) {
      await AuthBox.set(newAccessToken);
    }

    return newAccessToken;
  }

  return accessToken;
}
