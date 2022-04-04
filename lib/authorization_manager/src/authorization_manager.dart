import 'authorization_entity.dart';

abstract class AuthorizationManager {
  Future<void> initialize({
    Future<AuthorizationEntity?> Function(AuthorizationEntity)? onRefresh,
    Future<String> Function()? getStoreDirectory,
    Future<void> Function(AuthorizationEntity?)? onInitialize,
  });

  Future<AuthorizationEntity?> get();
  Future<AuthorizationEntity?> refresh();
  Future<AuthorizationEntity> set(AuthorizationEntity entity);
  Future<void> clear();

  Future<String?> getToken() async => (await get())?.token;
  Future<String?> getPayload() async => (await get())?.payload;
  Future<DateTime?> getExpiredAt() async => (await get())?.expiredAt;
}
