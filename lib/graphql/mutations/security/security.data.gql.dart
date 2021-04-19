// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:socfony/graphql/schema/schema.schema.gql.dart' as _i1;
import 'package:socfony/graphql/schema/serializers.gql.dart' as _i2;

part 'security.data.gql.g.dart';

abstract class GcreatePhoneSecurityData
    implements
        Built<GcreatePhoneSecurityData, GcreatePhoneSecurityDataBuilder> {
  GcreatePhoneSecurityData._();

  factory GcreatePhoneSecurityData(
          [Function(GcreatePhoneSecurityDataBuilder b) updates]) =
      _$GcreatePhoneSecurityData;

  static void _initializeBuilder(GcreatePhoneSecurityDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  _i1.GDateTime get createSecurity;
  static Serializer<GcreatePhoneSecurityData> get serializer =>
      _$gcreatePhoneSecurityDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i2.serializers.serializeWith(GcreatePhoneSecurityData.serializer, this)
          as Map<String, dynamic>);
  static GcreatePhoneSecurityData? fromJson(Map<String, dynamic> json) =>
      _i2.serializers
          .deserializeWith(GcreatePhoneSecurityData.serializer, json);
}

abstract class GcreatePhoneSecurityOfViewerData
    implements
        Built<GcreatePhoneSecurityOfViewerData,
            GcreatePhoneSecurityOfViewerDataBuilder> {
  GcreatePhoneSecurityOfViewerData._();

  factory GcreatePhoneSecurityOfViewerData(
          [Function(GcreatePhoneSecurityOfViewerDataBuilder b) updates]) =
      _$GcreatePhoneSecurityOfViewerData;

  static void _initializeBuilder(GcreatePhoneSecurityOfViewerDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  _i1.GDateTime get createViewerSecurity;
  static Serializer<GcreatePhoneSecurityOfViewerData> get serializer =>
      _$gcreatePhoneSecurityOfViewerDataSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers
          .serializeWith(GcreatePhoneSecurityOfViewerData.serializer, this)
      as Map<String, dynamic>);
  static GcreatePhoneSecurityOfViewerData? fromJson(
          Map<String, dynamic> json) =>
      _i2.serializers
          .deserializeWith(GcreatePhoneSecurityOfViewerData.serializer, json);
}
