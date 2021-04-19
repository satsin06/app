// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:socfony/graphql/mutations/sign-in/sign-in.ast.gql.dart' as _i5;
import 'package:socfony/graphql/mutations/sign-in/sign-in.data.gql.dart' as _i2;
import 'package:socfony/graphql/mutations/sign-in/sign-in.var.gql.dart' as _i3;
import 'package:socfony/graphql/schema/serializers.gql.dart' as _i6;

part 'sign-in.req.gql.g.dart';

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
