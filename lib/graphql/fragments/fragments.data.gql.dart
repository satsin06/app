// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:socfony/graphql/schema/serializers.gql.dart' as _i1;

part 'fragments.data.gql.g.dart';

abstract class GAuthorizationTokenFragment {
  String get G__typename;
  DateTime get expiredAt;
  DateTime get refreshExpiredAt;
  String get token;
  String get userId;
  Map<String, dynamic> toJson();
}

abstract class GAuthorizationTokenFragmentData
    implements
        Built<GAuthorizationTokenFragmentData,
            GAuthorizationTokenFragmentDataBuilder>,
        GAuthorizationTokenFragment {
  GAuthorizationTokenFragmentData._();

  factory GAuthorizationTokenFragmentData(
          [Function(GAuthorizationTokenFragmentDataBuilder b) updates]) =
      _$GAuthorizationTokenFragmentData;

  static void _initializeBuilder(GAuthorizationTokenFragmentDataBuilder b) =>
      b..G__typename = 'AuthorizationTokenEntity';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  DateTime get expiredAt;
  DateTime get refreshExpiredAt;
  String get token;
  String get userId;
  static Serializer<GAuthorizationTokenFragmentData> get serializer =>
      _$gAuthorizationTokenFragmentDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GAuthorizationTokenFragmentData.serializer, this)
      as Map<String, dynamic>);
  static GAuthorizationTokenFragmentData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GAuthorizationTokenFragmentData.serializer, json);
}
