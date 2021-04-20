// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:socfony/graphql/schema/serializers.gql.dart' as _i1;

part 'fragments.var.gql.g.dart';

abstract class GAuthorizationTokenFragmentVars
    implements
        Built<GAuthorizationTokenFragmentVars,
            GAuthorizationTokenFragmentVarsBuilder> {
  GAuthorizationTokenFragmentVars._();

  factory GAuthorizationTokenFragmentVars(
          [Function(GAuthorizationTokenFragmentVarsBuilder b) updates]) =
      _$GAuthorizationTokenFragmentVars;

  static Serializer<GAuthorizationTokenFragmentVars> get serializer =>
      _$gAuthorizationTokenFragmentVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GAuthorizationTokenFragmentVars.serializer, this)
      as Map<String, dynamic>);
  static GAuthorizationTokenFragmentVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GAuthorizationTokenFragmentVars.serializer, json);
}
