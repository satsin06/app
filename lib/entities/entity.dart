import 'package:get/get.dart';

/// Entity abstract class.
abstract class Entity<T> {
  /// The entity unique id.
  String get $id;

  /// Entity to JSON map.
  Map<String, dynamic> toJson();

  /// Use JSON map create entity.
  ///
  /// Created entity put [T] to `Get` dependency.
  ///
  /// [creator] is a entity create util function.
  ///
  /// [json] is create entity map data.
  static T $fromJson<T extends Entity<T>>(
          T creator(Map<String, dynamic> json), Map<String, dynamic> json) =>
      upsert(creator(json)).value;

  /// Using a [tag] find entity.
  ///
  /// [tag] is [Entity<T>] [$id] field.
  static Rx<T> find<T extends Entity<T>>(String tag,
      [void onError(dynamic error)]) {
    try {
      return Get.find<Rx<T>>(tag: tag);
    } catch (error) {
      if (onError is Function) onError(error);
    }

    return null;
  }

  /// Update or create entity.
  ///
  /// [entity] is extends <Entity<T>> class.
  static Rx<T> upsert<T extends Entity<T>>(T entity) {
    Rx<T> value = find(entity.$id);
    if (value == null || value.isBlank || value.value.isBlank) {
      return Get.put<Rx<T>>(entity.obs, tag: entity.$id);
    }
    value(entity);
    return value;
  }
}
