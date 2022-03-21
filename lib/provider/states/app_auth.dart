import 'package:flutter/widgets.dart';

import '../../graphql/auth/auth_box.dart';
import '../../graphql/auth/get_access_token.dart';
import '../../hive/models/access_token.dart';

class AppAuthState extends ChangeNotifier {
  static AppAuthState? _internal;

  AppAuthState._();

  factory AppAuthState() => _internal ??= AppAuthState._();

  // Current access token.
  AccessToken? _accessToken;

  /// Get the current access token.
  AccessToken? get accessToken => _accessToken;

  /// Get current login status.
  bool get isAuthenticated =>
      accessToken != null && accessToken!.expiredAt.isAfter(DateTime.now());

  /// Get current logged user ID.
  String? get userId => accessToken?.userId;

  /// Get current logged access token.
  void _setAccessToken(AccessToken? accessToken) {
    _accessToken = accessToken;
    notifyListeners();
  }

  /// Update access token, change logged status.
  Future<void> update(AccessToken? accessToken) async {
    _setAccessToken(accessToken);

    if (accessToken == null) {
      return AuthBox.delete();
    }

    return AuthBox.set(accessToken);
  }

  /// Logout.
  Future<void> delete() => AuthBox.delete();
}

/// Initialize [AppAuthState].
Future<void> initAppAuthState() async {
  // Get cached access token and with refresh.
  final AccessToken? accessToken = await getAccessTokenWithRefresh();

  // Set the current access token is cached access token.
  AppAuthState()._setAccessToken(accessToken);
}
