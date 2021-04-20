import 'package:built_collection/built_collection.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart'
    show Iso8601DateTimeSerializer;
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' show StandardJsonPlugin;
import 'package:gql_code_builder/src/serializers/operation_serializer.dart'
    show OperationSerializer;
import 'package:socfony/graphql/fragments/fragments.data.gql.dart'
    show GAuthorizationTokenFragmentData;
import 'package:socfony/graphql/fragments/fragments.req.gql.dart'
    show GAuthorizationTokenFragmentReq;
import 'package:socfony/graphql/fragments/fragments.var.gql.dart'
    show GAuthorizationTokenFragmentVars;
import 'package:socfony/graphql/mutations/mutations.data.gql.dart'
    show
        GCreateAuthorizationTokenData,
        GCreateAuthorizationTokenData_createAuthorizationToken,
        GCreatePhoneSecurityData,
        GCreatePhoneSecurityOfViewerData;
import 'package:socfony/graphql/mutations/mutations.req.gql.dart'
    show
        GCreateAuthorizationTokenReq,
        GCreatePhoneSecurityOfViewerReq,
        GCreatePhoneSecurityReq;
import 'package:socfony/graphql/mutations/mutations.var.gql.dart'
    show
        GCreateAuthorizationTokenVars,
        GCreatePhoneSecurityOfViewerVars,
        GCreatePhoneSecurityVars;
import 'package:socfony/graphql/schema/schema.schema.gql.dart'
    show
        GAllowUploadFileType,
        GDateTimeFilter,
        GMomentMediaType,
        GMomentOrderByInput,
        GMomentScalarFieldEnum,
        GMomentWhereInput,
        GMomentWhereUniqueInput,
        GQueryMode,
        GStringFilter,
        GUserOrderByInput,
        GUserProfileOrderByInput,
        GUserProfileRelationFilter,
        GUserProfileUpdateInput,
        GUserProfileWhereInput,
        GUserRelationFilter,
        GUserSecurityCompareType,
        GUserWhereInput,
        GUserWhereUniqueInput,
        GsortOrder;

part 'serializers.gql.g.dart';

final SerializersBuilder _serializersBuilder = _$serializers.toBuilder()
  ..add(OperationSerializer())
  ..add(Iso8601DateTimeSerializer())
  ..addPlugin(StandardJsonPlugin());
@SerializersFor([
  GAllowUploadFileType,
  GAuthorizationTokenFragmentData,
  GAuthorizationTokenFragmentReq,
  GAuthorizationTokenFragmentVars,
  GCreateAuthorizationTokenData,
  GCreateAuthorizationTokenData_createAuthorizationToken,
  GCreateAuthorizationTokenReq,
  GCreateAuthorizationTokenVars,
  GCreatePhoneSecurityData,
  GCreatePhoneSecurityOfViewerData,
  GCreatePhoneSecurityOfViewerReq,
  GCreatePhoneSecurityOfViewerVars,
  GCreatePhoneSecurityReq,
  GCreatePhoneSecurityVars,
  GDateTimeFilter,
  GMomentMediaType,
  GMomentOrderByInput,
  GMomentScalarFieldEnum,
  GMomentWhereInput,
  GMomentWhereUniqueInput,
  GQueryMode,
  GStringFilter,
  GUserOrderByInput,
  GUserProfileOrderByInput,
  GUserProfileRelationFilter,
  GUserProfileUpdateInput,
  GUserProfileWhereInput,
  GUserRelationFilter,
  GUserSecurityCompareType,
  GUserWhereInput,
  GUserWhereUniqueInput,
  GsortOrder
])
final Serializers serializers = _serializersBuilder.build();
