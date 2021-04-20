// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql/ast.dart' as _i5;
import 'package:socfony/graphql/fragments/fragments.ast.gql.dart' as _i4;
import 'package:socfony/graphql/fragments/fragments.data.gql.dart' as _i2;
import 'package:socfony/graphql/fragments/fragments.var.gql.dart' as _i3;
import 'package:socfony/graphql/schema/serializers.gql.dart' as _i6;

part 'fragments.req.gql.g.dart';

abstract class GAuthorizationTokenFragmentReq
    implements
        Built<GAuthorizationTokenFragmentReq,
            GAuthorizationTokenFragmentReqBuilder>,
        _i1.FragmentRequest<_i2.GAuthorizationTokenFragmentData,
            _i3.GAuthorizationTokenFragmentVars> {
  GAuthorizationTokenFragmentReq._();

  factory GAuthorizationTokenFragmentReq(
          [Function(GAuthorizationTokenFragmentReqBuilder b) updates]) =
      _$GAuthorizationTokenFragmentReq;

  static void _initializeBuilder(GAuthorizationTokenFragmentReqBuilder b) => b
    ..document = _i4.document
    ..fragmentName = 'AuthorizationTokenFragment';
  _i3.GAuthorizationTokenFragmentVars get vars;
  _i5.DocumentNode get document;
  String? get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GAuthorizationTokenFragmentData? parseData(Map<String, dynamic> json) =>
      _i2.GAuthorizationTokenFragmentData.fromJson(json);
  static Serializer<GAuthorizationTokenFragmentReq> get serializer =>
      _$gAuthorizationTokenFragmentReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
      GAuthorizationTokenFragmentReq.serializer, this) as Map<String, dynamic>);
  static GAuthorizationTokenFragmentReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers
          .deserializeWith(GAuthorizationTokenFragmentReq.serializer, json);
}
