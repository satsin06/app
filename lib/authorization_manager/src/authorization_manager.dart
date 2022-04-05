import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';

import 'authorization.dart';
import 'authorization_type.dart';

typedef AuthorizationReader = FutureOr<Authorization?> Function(
    AuthorizationType);
typedef AuthorizationWriter = FutureOr<void> Function(
    AuthorizationType, Authorization);
typedef AuthorizationRefresher = FutureOr<void> Function(AuthorizationManager);
typedef AuthorizationClear = FutureOr<void> Function(AuthorizationManager);

class AuthorizationManager with ChangeNotifier {
  AuthorizationManager({
    required this.reader,
    required this.writer,
    this.refresher,
    AuthorizationClear? clear,
  }) : _clear = clear {
    _createTimer(true);
  }

  final AuthorizationReader reader;
  final AuthorizationWriter writer;
  final AuthorizationClear? _clear;
  final AuthorizationRefresher? refresher;
  Timer? _timer;

  FutureOr<Authorization?> getAccessToken() => reader(AuthorizationType.access);
  FutureOr<Authorization?> getRefreshToken() =>
      reader(AuthorizationType.refresh);

  Future<void> store(
    AuthorizationType type,
    Authorization authorization,
  ) async {
    await writer(type, authorization..$type = type.value);
    if (type == AuthorizationType.access) {
      _createTimer();
    }
    notifyListeners();
  }

  Future<void> clear() async {
    await _clear?.call(this);
    _timer?.cancel();
    notifyListeners();
  }

  Future<void>? refresh() async => await refresher?.call(this);

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

  Future<void> _createTimer([bool first = false]) async {
    final accessToken = await getAccessToken();
    final diff = accessToken?.expiredAt.difference(DateTime.now());
    final int inMinutes = diff?.inMinutes ?? 0;
    print(inMinutes);

    if (first || inMinutes <= 5) {
      return await refresh();
    }

    _timer?.cancel();
    _timer = Timer(Duration(minutes: max(5, inMinutes - 5)), refresh);
  }
}
