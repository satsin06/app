// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:socfony/graphql/schema/serializers.gql.dart' as _i1;

part 'sign-in.data.gql.g.dart';

abstract class GCreateAuthorizationTokenData
    implements
        Built<GCreateAuthorizationTokenData,
            GCreateAuthorizationTokenDataBuilder> {
  GCreateAuthorizationTokenData._();

  factory GCreateAuthorizationTokenData(
          [Function(GCreateAuthorizationTokenDataBuilder b) updates]) =
      _$GCreateAuthorizationTokenData;

  static void _initializeBuilder(GCreateAuthorizationTokenDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GCreateAuthorizationTokenData_createAuthorizationToken
      get createAuthorizationToken;
  static Serializer<GCreateAuthorizationTokenData> get serializer =>
      _$gCreateAuthorizationTokenDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GCreateAuthorizationTokenData.serializer, this) as Map<String, dynamic>);
  static GCreateAuthorizationTokenData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GCreateAuthorizationTokenData.serializer, json);
}

abstract class GCreateAuthorizationTokenData_createAuthorizationToken
    implements
        Built<GCreateAuthorizationTokenData_createAuthorizationToken,
            GCreateAuthorizationTokenData_createAuthorizationTokenBuilder> {
  GCreateAuthorizationTokenData_createAuthorizationToken._();

  factory GCreateAuthorizationTokenData_createAuthorizationToken(
      [Function(GCreateAuthorizationTokenData_createAuthorizationTokenBuilder b)
          updates]) = _$GCreateAuthorizationTokenData_createAuthorizationToken;

  static void _initializeBuilder(
          GCreateAuthorizationTokenData_createAuthorizationTokenBuilder b) =>
      b..G__typename = 'AuthorizationTokenEntity';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get token;
  String get userId;
  static Serializer<GCreateAuthorizationTokenData_createAuthorizationToken>
      get serializer =>
          _$gCreateAuthorizationTokenDataCreateAuthorizationTokenSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GCreateAuthorizationTokenData_createAuthorizationToken.serializer,
      this) as Map<String, dynamic>);
  static GCreateAuthorizationTokenData_createAuthorizationToken? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GCreateAuthorizationTokenData_createAuthorizationToken.serializer,
          json);
}
