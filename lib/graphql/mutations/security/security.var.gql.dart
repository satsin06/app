// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:socfony/graphql/schema/serializers.gql.dart' as _i1;

part 'security.var.gql.g.dart';

abstract class GcreatePhoneSecurityVars
    implements
        Built<GcreatePhoneSecurityVars, GcreatePhoneSecurityVarsBuilder> {
  GcreatePhoneSecurityVars._();

  factory GcreatePhoneSecurityVars(
          [Function(GcreatePhoneSecurityVarsBuilder b) updates]) =
      _$GcreatePhoneSecurityVars;

  String get phone;
  static Serializer<GcreatePhoneSecurityVars> get serializer =>
      _$gcreatePhoneSecurityVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GcreatePhoneSecurityVars.serializer, this)
          as Map<String, dynamic>);
  static GcreatePhoneSecurityVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GcreatePhoneSecurityVars.serializer, json);
}

abstract class GcreatePhoneSecurityOfViewerVars
    implements
        Built<GcreatePhoneSecurityOfViewerVars,
            GcreatePhoneSecurityOfViewerVarsBuilder> {
  GcreatePhoneSecurityOfViewerVars._();

  factory GcreatePhoneSecurityOfViewerVars(
          [Function(GcreatePhoneSecurityOfViewerVarsBuilder b) updates]) =
      _$GcreatePhoneSecurityOfViewerVars;

  static Serializer<GcreatePhoneSecurityOfViewerVars> get serializer =>
      _$gcreatePhoneSecurityOfViewerVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GcreatePhoneSecurityOfViewerVars.serializer, this)
      as Map<String, dynamic>);
  static GcreatePhoneSecurityOfViewerVars? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GcreatePhoneSecurityOfViewerVars.serializer, json);
}
