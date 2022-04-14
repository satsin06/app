import 'dart:async';
import 'dart:convert';

import 'package:authorization_manager/authorization_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/api.dart';
import 'api.dart';
import 'shared_preferences.dart';

Future<void> _refresher(Ref ref, AuthorizationManager manager) async {
  final AccessTokenService service = ref.read($APIProvider).accessToken;

  try {
    final AccessToken accessToken = await service.refresh();

    // Write access token to authorization manager.
    await manager.store(Authorization(
      type: AuthorizationType.access,
      token: accessToken.token,
      payload: accessToken.userId,
      expiredAt: accessToken.expiredAt,
    ));
    await manager.store(Authorization(
      type: AuthorizationType.refresh,
      token: accessToken.token,
      payload: accessToken.userId,
      expiredAt: accessToken.refreshExpiredAt,
    ));
  } catch (e) {
    if (e is FormatException &&
        e.message.toLowerCase() == 'Unauthorized'.toLowerCase()) {
      return await manager.clear();
    }

    rethrow;
  }
}

Future<Authorization?> _render(Ref ref, AuthorizationType type) async {
  final sharedPreferences = await ref.read($SharedPreferencesProvider.future);
  final token = sharedPreferences.getString('${type.name}_token');

  try {
    return Authorization.fromJson(jsonDecode(token!));
  } catch (e) {
    return null;
  }
}

Future<void> _writer(Ref ref, Authorization authorization) async {
  final sharedPreferences = await ref.read($SharedPreferencesProvider.future);

  await sharedPreferences.setString(
    '${authorization.type.name}_token',
    jsonEncode(authorization.toJson()),
  );
}

Future<void> _clear(Ref ref) async {
  final sharedPreferences = await ref.read($SharedPreferencesProvider.future);

  for (AuthorizationType type in AuthorizationType.values) {
    await sharedPreferences.remove('${type.name}_token');
  }
}

final $AuthorizationManagerProvider = Provider<AuthorizationManager>(
  (ref) => AuthorizationManager(
    clear: (manager) => _clear(ref),
    refresher: (manager) => _refresher(ref, manager),
    reader: (type) => _render(ref, type),
    writer: (entity) => _writer(ref, entity),
  ),
);
