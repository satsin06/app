import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' show StandardJsonPlugin;
import 'package:gql_code_builder/src/serializers/operation_serializer.dart'
    show OperationSerializer;
import 'package:socfony/graphql/mutations/security/security.data.gql.dart'
    show GcreatePhoneSecurityData, GcreatePhoneSecurityOfViewerData;
import 'package:socfony/graphql/mutations/security/security.req.gql.dart'
    show GcreatePhoneSecurityOfViewerReq, GcreatePhoneSecurityReq;
import 'package:socfony/graphql/mutations/security/security.var.gql.dart'
    show GcreatePhoneSecurityOfViewerVars, GcreatePhoneSecurityVars;
import 'package:socfony/graphql/mutations/sign-in/sign-in.data.gql.dart'
    show
        GCreateAuthorizationTokenData,
        GCreateAuthorizationTokenData_createAuthorizationToken;
import 'package:socfony/graphql/mutations/sign-in/sign-in.req.gql.dart'
    show GCreateAuthorizationTokenReq;
import 'package:socfony/graphql/mutations/sign-in/sign-in.var.gql.dart'
    show GCreateAuthorizationTokenVars;
import 'package:socfony/graphql/schema/schema.schema.gql.dart'
    show
        GAllowUploadFileType,
        GDateTime,
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
  ..addPlugin(StandardJsonPlugin());
@SerializersFor([
  GAllowUploadFileType,
  GCreateAuthorizationTokenData,
  GCreateAuthorizationTokenData_createAuthorizationToken,
  GCreateAuthorizationTokenReq,
  GCreateAuthorizationTokenVars,
  GDateTime,
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
  GcreatePhoneSecurityData,
  GcreatePhoneSecurityOfViewerData,
  GcreatePhoneSecurityOfViewerReq,
  GcreatePhoneSecurityOfViewerVars,
  GcreatePhoneSecurityReq,
  GcreatePhoneSecurityVars,
  GsortOrder
])
final Serializers serializers = _serializersBuilder.build();
