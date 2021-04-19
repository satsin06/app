// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:socfony/graphql/schema/schema.schema.gql.dart' as _i2;
import 'package:socfony/graphql/schema/serializers.gql.dart' as _i1;

part 'mutations.var.gql.g.dart';

abstract class GCreatePhoneSecurityVars
    implements
        Built<GCreatePhoneSecurityVars, GCreatePhoneSecurityVarsBuilder> {
  GCreatePhoneSecurityVars._();

  factory GCreatePhoneSecurityVars(
          [Function(GCreatePhoneSecurityVarsBuilder b) updates]) =
      _$GCreatePhoneSecurityVars;

  String get phone;
  static Serializer<GCreatePhoneSecurityVars> get serializer =>
      _$gCreatePhoneSecurityVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GCreatePhoneSecurityVars.serializer, this)
          as Map<String, dynamic>);
  static GCreatePhoneSecurityVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GCreatePhoneSecurityVars.serializer, json);
}

abstract class GCreatePhoneSecurityOfViewerVars
    implements
        Built<GCreatePhoneSecurityOfViewerVars,
            GCreatePhoneSecurityOfViewerVarsBuilder> {
  GCreatePhoneSecurityOfViewerVars._();

  factory GCreatePhoneSecurityOfViewerVars(
          [Function(GCreatePhoneSecurityOfViewerVarsBuilder b) updates]) =
      _$GCreatePhoneSecurityOfViewerVars;

  static Serializer<GCreatePhoneSecurityOfViewerVars> get serializer =>
      _$gCreatePhoneSecurityOfViewerVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GCreatePhoneSecurityOfViewerVars.serializer, this)
      as Map<String, dynamic>);
  static GCreatePhoneSecurityOfViewerVars? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GCreatePhoneSecurityOfViewerVars.serializer, json);
}

abstract class GCreateAuthorizationTokenVars
    implements
        Built<GCreateAuthorizationTokenVars,
            GCreateAuthorizationTokenVarsBuilder> {
  GCreateAuthorizationTokenVars._();

  factory GCreateAuthorizationTokenVars(
          [Function(GCreateAuthorizationTokenVarsBuilder b) updates]) =
      _$GCreateAuthorizationTokenVars;

  _i2.GUserWhereUniqueInput get user;
  _i2.GUserSecurityCompareType get type;
  String get security;
  static Serializer<GCreateAuthorizationTokenVars> get serializer =>
      _$gCreateAuthorizationTokenVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GCreateAuthorizationTokenVars.serializer, this) as Map<String, dynamic>);
  static GCreateAuthorizationTokenVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GCreateAuthorizationTokenVars.serializer, json);
}
