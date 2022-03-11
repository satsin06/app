import 'dart:async';

import 'package:hive/hive.dart';

import '../../hive/hive.dart';
import '../constants.dart';
import 'refresh_access_token.dart';

/// Get the [Box] from [Hive].
Future<Box<AccessToken>> _getBox() async {
  if (Hive.isBoxOpen(authHeaderKey)) {
    return Hive.box<AccessToken>(authHeaderKey);
  }

  return Hive.openBox<AccessToken>(authHeaderKey);
}

/// Get the [AccessToken] from cached.
FutureOr<AccessToken?> getCachedAccessToken() async =>
    (await _getBox()).get(authHeaderKey);

/// Get the [AccessToken] from cached.
///
/// If the [AccessToken] is expired, it will refresh the [AccessToken].
FutureOr<AccessToken?> getAccessTokenWithRefresh() async {
  final AccessToken? accessToken = await getCachedAccessToken();

  if (accessToken != null &&
      accessToken.expiredAt.difference(DateTime.now()).inMinutes < 5) {
    return refreshAccessToken();
  }

  return accessToken;
}
