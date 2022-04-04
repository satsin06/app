import 'package:isar/isar.dart';

import 'authorization_entity.dart';
import 'authorization_manager.dart';

class _AuthorizationManagerImpl extends AuthorizationManager {
  /// Authorization manager is initialized.
  bool _isInitialized = false;

  /// Cached Isar instance.
  late final Isar _isar;

  /// Cached onRefresh callback.
  late final Future<AuthorizationEntity?> Function(AuthorizationEntity entity)?
      _onRefresh;

  /// Get entities collection.
  IsarCollection<AuthorizationEntity> get _entities =>
      _isar.authorizationEntitys;

  @override
  Future<AuthorizationEntity?> get() async {
    _onCheckInitialize();

    // Fetch current authorization entity.
    final AuthorizationEntity? entity =
        await _entities.filter().isRefreshTokenEqualTo(false).findFirst();

    // If entity is null, return null.
    if (entity == null) {
      return null;
    }

    // If entity is expired, refresh it.
    if (entity.expiredAt.isBefore(DateTime.now())) {
      try {
        return await refresh();
      } catch (e) {
        await _entities.clear();
        return null;
      }
    }

    return entity;
  }

  @override
  Future<AuthorizationEntity?> refresh() async {
    _onCheckInitialize();
    // Fetch current authorization entity.
    final AuthorizationEntity? entity =
        await _entities.filter().isRefreshTokenEqualTo(true).findFirst();

    // if entity is null or expired, throw exception.
    if (entity == null || entity.expiredAt.isBefore(DateTime.now())) {
      await clear();
      return null;
    }

    // If onRefresh is null, throw exception.
    if (_onRefresh == null) {
      return null;
    }

    // Refresh authorization entity.
    final AuthorizationEntity? refreshedEntity = await _onRefresh!.call(entity);
    if (refreshedEntity == null) {
      await clear();
      return null;
    }

    // Set new authorization entity, and return it.
    await set(refreshedEntity);

    return refreshedEntity;
  }

  @override
  Future<AuthorizationEntity> set(AuthorizationEntity entity) async {
    _onCheckInitialize();
    await clear();
    await _entities.put(entity, replaceOnConflict: true, saveLinks: true);

    return entity;
  }

  @override
  Future<void> clear() {
    _onCheckInitialize();
    return _entities.clear();
  }

  @override
  Future<void> initialize({
    Future<AuthorizationEntity?> Function(AuthorizationEntity)? onRefresh,
    Future<String> Function()? getStoreDirectory,
    Future<void> Function(AuthorizationEntity?)? onInitialize,
  }) async {
    if (_isInitialized) {
      throw Exception('AuthorizationManager is already initialized');
    }

    _isar = await Isar.open(
      schemas: [AuthorizationEntitySchema],
      name: r'Authorization Manager',
      directory: await getStoreDirectory?.call(),
      inspector: true,
    );
    _isInitialized = true;
    _onRefresh = onRefresh;

    // Run onInitialize callback.
    await onInitialize?.call(await get());
  }

  void _onCheckInitialize() {
    if (!_isInitialized) {
      throw Exception('AuthorizationManager is not initialized');
    }
  }
}

final AuthorizationManager authorizationManager = _AuthorizationManagerImpl();
