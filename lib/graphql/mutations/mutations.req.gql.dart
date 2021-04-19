// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:socfony/graphql/mutations/mutations.ast.gql.dart' as _i5;
import 'package:socfony/graphql/mutations/mutations.data.gql.dart' as _i2;
import 'package:socfony/graphql/mutations/mutations.var.gql.dart' as _i3;
import 'package:socfony/graphql/schema/serializers.gql.dart' as _i6;

part 'mutations.req.gql.g.dart';

abstract class GCreatePhoneSecurityReq
    implements
        Built<GCreatePhoneSecurityReq, GCreatePhoneSecurityReqBuilder>,
        _i1.OperationRequest<_i2.GCreatePhoneSecurityData,
            _i3.GCreatePhoneSecurityVars> {
  GCreatePhoneSecurityReq._();

  factory GCreatePhoneSecurityReq(
          [Function(GCreatePhoneSecurityReqBuilder b) updates]) =
      _$GCreatePhoneSecurityReq;

  static void _initializeBuilder(GCreatePhoneSecurityReqBuilder b) => b
    ..operation = _i4.Operation(
        document: _i5.document, operationName: 'CreatePhoneSecurity')
    ..executeOnListen = true;
  _i3.GCreatePhoneSecurityVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GCreatePhoneSecurityData? Function(
          _i2.GCreatePhoneSecurityData?, _i2.GCreatePhoneSecurityData?)?
      get updateResult;
  _i2.GCreatePhoneSecurityData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GCreatePhoneSecurityData? parseData(Map<String, dynamic> json) =>
      _i2.GCreatePhoneSecurityData.fromJson(json);
  static Serializer<GCreatePhoneSecurityReq> get serializer =>
      _$gCreatePhoneSecurityReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GCreatePhoneSecurityReq.serializer, this)
          as Map<String, dynamic>);
  static GCreatePhoneSecurityReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GCreatePhoneSecurityReq.serializer, json);
}

abstract class GCreatePhoneSecurityOfViewerReq
    implements
        Built<GCreatePhoneSecurityOfViewerReq,
            GCreatePhoneSecurityOfViewerReqBuilder>,
        _i1.OperationRequest<_i2.GCreatePhoneSecurityOfViewerData,
            _i3.GCreatePhoneSecurityOfViewerVars> {
  GCreatePhoneSecurityOfViewerReq._();

  factory GCreatePhoneSecurityOfViewerReq(
          [Function(GCreatePhoneSecurityOfViewerReqBuilder b) updates]) =
      _$GCreatePhoneSecurityOfViewerReq;

  static void _initializeBuilder(GCreatePhoneSecurityOfViewerReqBuilder b) => b
    ..operation = _i4.Operation(
        document: _i5.document, operationName: 'CreatePhoneSecurityOfViewer')
    ..executeOnListen = true;
  _i3.GCreatePhoneSecurityOfViewerVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GCreatePhoneSecurityOfViewerData? Function(
      _i2.GCreatePhoneSecurityOfViewerData?,
      _i2.GCreatePhoneSecurityOfViewerData?)? get updateResult;
  _i2.GCreatePhoneSecurityOfViewerData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GCreatePhoneSecurityOfViewerData? parseData(Map<String, dynamic> json) =>
      _i2.GCreatePhoneSecurityOfViewerData.fromJson(json);
  static Serializer<GCreatePhoneSecurityOfViewerReq> get serializer =>
      _$gCreatePhoneSecurityOfViewerReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers
          .serializeWith(GCreatePhoneSecurityOfViewerReq.serializer, this)
      as Map<String, dynamic>);
  static GCreatePhoneSecurityOfViewerReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers
          .deserializeWith(GCreatePhoneSecurityOfViewerReq.serializer, json);
}

abstract class GCreateAuthorizationTokenReq
    implements
        Built<GCreateAuthorizationTokenReq,
            GCreateAuthorizationTokenReqBuilder>,
        _i1.OperationRequest<_i2.GCreateAuthorizationTokenData,
            _i3.GCreateAuthorizationTokenVars> {
  GCreateAuthorizationTokenReq._();

  factory GCreateAuthorizationTokenReq(
          [Function(GCreateAuthorizationTokenReqBuilder b) updates]) =
      _$GCreateAuthorizationTokenReq;

  static void _initializeBuilder(GCreateAuthorizationTokenReqBuilder b) => b
    ..operation = _i4.Operation(
        document: _i5.document, operationName: 'CreateAuthorizationToken')
    ..executeOnListen = true;
  _i3.GCreateAuthorizationTokenVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GCreateAuthorizationTokenData? Function(
      _i2.GCreateAuthorizationTokenData?,
      _i2.GCreateAuthorizationTokenData?)? get updateResult;
  _i2.GCreateAuthorizationTokenData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GCreateAuthorizationTokenData? parseData(Map<String, dynamic> json) =>
      _i2.GCreateAuthorizationTokenData.fromJson(json);
  static Serializer<GCreateAuthorizationTokenReq> get serializer =>
      _$gCreateAuthorizationTokenReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
      GCreateAuthorizationTokenReq.serializer, this) as Map<String, dynamic>);
  static GCreateAuthorizationTokenReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers
          .deserializeWith(GCreateAuthorizationTokenReq.serializer, json);
}
