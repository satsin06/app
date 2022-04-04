import 'package:flutter/foundation.dart';

import '../authorization_manager/authorization_manager.dart';

class AuthorizationController extends ChangeNotifier {
  static AuthorizationController? _internal;

  AuthorizationController._();
  factory AuthorizationController() =>
      _internal ??= AuthorizationController._();

  static Future<void> initialize(AuthorizationEntity? entity) async {
    AuthorizationController().setEntity(entity);
  }

  static Future<AuthorizationEntity?> requestRefresh(
      AuthorizationEntity entity) async {
    const String document = r'''
      mutation refresh($input: RefreshInput!) {
        refresh(input: $input) {
          accessToken
          refreshToken
          expiresIn
          tokenType
        }
      }
    ''';
    final controller = AuthorizationController();

    return null;
  }

  void setEntity(AuthorizationEntity? value) {
    entity = value;
    if (value != null) {
      notifyListeners();
    }
  }

  AuthorizationEntity? entity;

  String? get userId => entity?.payload;

  bool get authorized =>
      entity != null && entity!.expiredAt.isAfter(DateTime.now());
}
