// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:socfony/graphql/mutations/security/security.ast.gql.dart'
    as _i5;
import 'package:socfony/graphql/mutations/security/security.data.gql.dart'
    as _i2;
import 'package:socfony/graphql/mutations/security/security.var.gql.dart'
    as _i3;
import 'package:socfony/graphql/schema/serializers.gql.dart' as _i6;

part 'security.req.gql.g.dart';

abstract class GcreatePhoneSecurityReq
    implements
        Built<GcreatePhoneSecurityReq, GcreatePhoneSecurityReqBuilder>,
        _i1.OperationRequest<_i2.GcreatePhoneSecurityData,
            _i3.GcreatePhoneSecurityVars> {
  GcreatePhoneSecurityReq._();

  factory GcreatePhoneSecurityReq(
          [Function(GcreatePhoneSecurityReqBuilder b) updates]) =
      _$GcreatePhoneSecurityReq;

  static void _initializeBuilder(GcreatePhoneSecurityReqBuilder b) => b
    ..operation = _i4.Operation(
        document: _i5.document, operationName: 'createPhoneSecurity')
    ..executeOnListen = true;
  _i3.GcreatePhoneSecurityVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GcreatePhoneSecurityData? Function(
          _i2.GcreatePhoneSecurityData?, _i2.GcreatePhoneSecurityData?)?
      get updateResult;
  _i2.GcreatePhoneSecurityData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GcreatePhoneSecurityData? parseData(Map<String, dynamic> json) =>
      _i2.GcreatePhoneSecurityData.fromJson(json);
  static Serializer<GcreatePhoneSecurityReq> get serializer =>
      _$gcreatePhoneSecurityReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GcreatePhoneSecurityReq.serializer, this)
          as Map<String, dynamic>);
  static GcreatePhoneSecurityReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GcreatePhoneSecurityReq.serializer, json);
}

abstract class GcreatePhoneSecurityOfViewerReq
    implements
        Built<GcreatePhoneSecurityOfViewerReq,
            GcreatePhoneSecurityOfViewerReqBuilder>,
        _i1.OperationRequest<_i2.GcreatePhoneSecurityOfViewerData,
            _i3.GcreatePhoneSecurityOfViewerVars> {
  GcreatePhoneSecurityOfViewerReq._();

  factory GcreatePhoneSecurityOfViewerReq(
          [Function(GcreatePhoneSecurityOfViewerReqBuilder b) updates]) =
      _$GcreatePhoneSecurityOfViewerReq;

  static void _initializeBuilder(GcreatePhoneSecurityOfViewerReqBuilder b) => b
    ..operation = _i4.Operation(
        document: _i5.document, operationName: 'createPhoneSecurityOfViewer')
    ..executeOnListen = true;
  _i3.GcreatePhoneSecurityOfViewerVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GcreatePhoneSecurityOfViewerData? Function(
      _i2.GcreatePhoneSecurityOfViewerData?,
      _i2.GcreatePhoneSecurityOfViewerData?)? get updateResult;
  _i2.GcreatePhoneSecurityOfViewerData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GcreatePhoneSecurityOfViewerData? parseData(Map<String, dynamic> json) =>
      _i2.GcreatePhoneSecurityOfViewerData.fromJson(json);
  static Serializer<GcreatePhoneSecurityOfViewerReq> get serializer =>
      _$gcreatePhoneSecurityOfViewerReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers
          .serializeWith(GcreatePhoneSecurityOfViewerReq.serializer, this)
      as Map<String, dynamic>);
  static GcreatePhoneSecurityOfViewerReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers
          .deserializeWith(GcreatePhoneSecurityOfViewerReq.serializer, json);
}
