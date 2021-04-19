// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:socfony/graphql/schema/schema.schema.gql.dart' as _i1;
import 'package:socfony/graphql/schema/serializers.gql.dart' as _i2;

part 'sign-in.var.gql.g.dart';

abstract class GCreateAuthorizationTokenVars
    implements
        Built<GCreateAuthorizationTokenVars,
            GCreateAuthorizationTokenVarsBuilder> {
  GCreateAuthorizationTokenVars._();

  factory GCreateAuthorizationTokenVars(
          [Function(GCreateAuthorizationTokenVarsBuilder b) updates]) =
      _$GCreateAuthorizationTokenVars;

  _i1.GUserWhereUniqueInput get user;
  _i1.GUserSecurityCompareType get type;
  String get security;
  static Serializer<GCreateAuthorizationTokenVars> get serializer =>
      _$gCreateAuthorizationTokenVarsSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
      GCreateAuthorizationTokenVars.serializer, this) as Map<String, dynamic>);
  static GCreateAuthorizationTokenVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers
          .deserializeWith(GCreateAuthorizationTokenVars.serializer, json);
}
