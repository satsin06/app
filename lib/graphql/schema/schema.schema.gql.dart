// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_code_builder/src/serializers/default_scalar_serializer.dart'
    as _i1;
import 'package:socfony/graphql/schema/serializers.gql.dart' as _i2;

part 'schema.schema.gql.g.dart';

class GAllowUploadFileType extends EnumClass {
  const GAllowUploadFileType._(String name) : super(name);

  static const GAllowUploadFileType GIF = _$gAllowUploadFileTypeGIF;

  static const GAllowUploadFileType JPG = _$gAllowUploadFileTypeJPG;

  static const GAllowUploadFileType MP3 = _$gAllowUploadFileTypeMP3;

  static const GAllowUploadFileType MP4 = _$gAllowUploadFileTypeMP4;

  static const GAllowUploadFileType OGG = _$gAllowUploadFileTypeOGG;

  static const GAllowUploadFileType PNG = _$gAllowUploadFileTypePNG;

  static const GAllowUploadFileType WAV = _$gAllowUploadFileTypeWAV;

  static Serializer<GAllowUploadFileType> get serializer =>
      _$gAllowUploadFileTypeSerializer;
  static BuiltSet<GAllowUploadFileType> get values =>
      _$gAllowUploadFileTypeValues;
  static GAllowUploadFileType valueOf(String name) =>
      _$gAllowUploadFileTypeValueOf(name);
}

abstract class GDateTime implements Built<GDateTime, GDateTimeBuilder> {
  GDateTime._();

  factory GDateTime([String? value]) =>
      _$GDateTime((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GDateTime> get serializer =>
      _i1.DefaultScalarSerializer<GDateTime>(
          (Object serialized) => GDateTime((serialized as String?)));
}

abstract class GDateTimeFilter
    implements Built<GDateTimeFilter, GDateTimeFilterBuilder> {
  GDateTimeFilter._();

  factory GDateTimeFilter([Function(GDateTimeFilterBuilder b) updates]) =
      _$GDateTimeFilter;

  GDateTime? get equals;
  GDateTime? get gt;
  GDateTime? get gte;
  @BuiltValueField(wireName: 'in')
  BuiltList<GDateTime>? get Gin;
  GDateTime? get lt;
  GDateTime? get lte;
  GDateTimeFilter? get not;
  BuiltList<GDateTime>? get notIn;
  static Serializer<GDateTimeFilter> get serializer =>
      _$gDateTimeFilterSerializer;
  Map<String, dynamic> toJson() =>
      (_i2.serializers.serializeWith(GDateTimeFilter.serializer, this)
          as Map<String, dynamic>);
  static GDateTimeFilter? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GDateTimeFilter.serializer, json);
}

class GMomentMediaType extends EnumClass {
  const GMomentMediaType._(String name) : super(name);

  static const GMomentMediaType AUDIO = _$gMomentMediaTypeAUDIO;

  static const GMomentMediaType IMAGE = _$gMomentMediaTypeIMAGE;

  static const GMomentMediaType VIDEO = _$gMomentMediaTypeVIDEO;

  static Serializer<GMomentMediaType> get serializer =>
      _$gMomentMediaTypeSerializer;
  static BuiltSet<GMomentMediaType> get values => _$gMomentMediaTypeValues;
  static GMomentMediaType valueOf(String name) =>
      _$gMomentMediaTypeValueOf(name);
}

abstract class GMomentOrderByInput
    implements Built<GMomentOrderByInput, GMomentOrderByInputBuilder> {
  GMomentOrderByInput._();

  factory GMomentOrderByInput(
      [Function(GMomentOrderByInputBuilder b) updates]) = _$GMomentOrderByInput;

  GsortOrder? get content;
  GsortOrder? get createdAt;
  GsortOrder? get deletedAt;
  GsortOrder? get id;
  GsortOrder? get media;
  GUserOrderByInput? get owner;
  GsortOrder? get ownerId;
  GsortOrder? get title;
  static Serializer<GMomentOrderByInput> get serializer =>
      _$gMomentOrderByInputSerializer;
  Map<String, dynamic> toJson() =>
      (_i2.serializers.serializeWith(GMomentOrderByInput.serializer, this)
          as Map<String, dynamic>);
  static GMomentOrderByInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GMomentOrderByInput.serializer, json);
}

class GMomentScalarFieldEnum extends EnumClass {
  const GMomentScalarFieldEnum._(String name) : super(name);

  static const GMomentScalarFieldEnum content = _$gMomentScalarFieldEnumcontent;

  static const GMomentScalarFieldEnum createdAt =
      _$gMomentScalarFieldEnumcreatedAt;

  static const GMomentScalarFieldEnum deletedAt =
      _$gMomentScalarFieldEnumdeletedAt;

  static const GMomentScalarFieldEnum id = _$gMomentScalarFieldEnumid;

  static const GMomentScalarFieldEnum media = _$gMomentScalarFieldEnummedia;

  static const GMomentScalarFieldEnum ownerId = _$gMomentScalarFieldEnumownerId;

  static const GMomentScalarFieldEnum title = _$gMomentScalarFieldEnumtitle;

  static Serializer<GMomentScalarFieldEnum> get serializer =>
      _$gMomentScalarFieldEnumSerializer;
  static BuiltSet<GMomentScalarFieldEnum> get values =>
      _$gMomentScalarFieldEnumValues;
  static GMomentScalarFieldEnum valueOf(String name) =>
      _$gMomentScalarFieldEnumValueOf(name);
}

abstract class GMomentWhereInput
    implements Built<GMomentWhereInput, GMomentWhereInputBuilder> {
  GMomentWhereInput._();

  factory GMomentWhereInput([Function(GMomentWhereInputBuilder b) updates]) =
      _$GMomentWhereInput;

  BuiltList<GMomentWhereInput>? get AND;
  BuiltList<GMomentWhereInput>? get NOT;
  BuiltList<GMomentWhereInput>? get OR;
  GStringFilter? get content;
  GDateTimeFilter? get createdAt;
  GStringFilter? get id;
  GUserRelationFilter? get owner;
  GStringFilter? get ownerId;
  GStringFilter? get title;
  static Serializer<GMomentWhereInput> get serializer =>
      _$gMomentWhereInputSerializer;
  Map<String, dynamic> toJson() =>
      (_i2.serializers.serializeWith(GMomentWhereInput.serializer, this)
          as Map<String, dynamic>);
  static GMomentWhereInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GMomentWhereInput.serializer, json);
}

abstract class GMomentWhereUniqueInput
    implements Built<GMomentWhereUniqueInput, GMomentWhereUniqueInputBuilder> {
  GMomentWhereUniqueInput._();

  factory GMomentWhereUniqueInput(
          [Function(GMomentWhereUniqueInputBuilder b) updates]) =
      _$GMomentWhereUniqueInput;

  String? get id;
  static Serializer<GMomentWhereUniqueInput> get serializer =>
      _$gMomentWhereUniqueInputSerializer;
  Map<String, dynamic> toJson() =>
      (_i2.serializers.serializeWith(GMomentWhereUniqueInput.serializer, this)
          as Map<String, dynamic>);
  static GMomentWhereUniqueInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GMomentWhereUniqueInput.serializer, json);
}

class GQueryMode extends EnumClass {
  const GQueryMode._(String name) : super(name);

  @BuiltValueEnumConst(wireName: 'default')
  static const GQueryMode Gdefault = _$gQueryModeGdefault;

  static const GQueryMode insensitive = _$gQueryModeinsensitive;

  static Serializer<GQueryMode> get serializer => _$gQueryModeSerializer;
  static BuiltSet<GQueryMode> get values => _$gQueryModeValues;
  static GQueryMode valueOf(String name) => _$gQueryModeValueOf(name);
}

abstract class GStringFilter
    implements Built<GStringFilter, GStringFilterBuilder> {
  GStringFilter._();

  factory GStringFilter([Function(GStringFilterBuilder b) updates]) =
      _$GStringFilter;

  String? get contains;
  String? get endsWith;
  String? get equals;
  String? get gt;
  String? get gte;
  @BuiltValueField(wireName: 'in')
  BuiltList<String>? get Gin;
  String? get lt;
  String? get lte;
  GQueryMode? get mode;
  GStringFilter? get not;
  BuiltList<String>? get notIn;
  String? get startsWith;
  static Serializer<GStringFilter> get serializer => _$gStringFilterSerializer;
  Map<String, dynamic> toJson() =>
      (_i2.serializers.serializeWith(GStringFilter.serializer, this)
          as Map<String, dynamic>);
  static GStringFilter? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GStringFilter.serializer, json);
}

abstract class GUserOrderByInput
    implements Built<GUserOrderByInput, GUserOrderByInputBuilder> {
  GUserOrderByInput._();

  factory GUserOrderByInput([Function(GUserOrderByInputBuilder b) updates]) =
      _$GUserOrderByInput;

  GsortOrder? get createdAt;
  GsortOrder? get id;
  GsortOrder? get password;
  GsortOrder? get phone;
  GUserProfileOrderByInput? get profile;
  GsortOrder? get username;
  static Serializer<GUserOrderByInput> get serializer =>
      _$gUserOrderByInputSerializer;
  Map<String, dynamic> toJson() =>
      (_i2.serializers.serializeWith(GUserOrderByInput.serializer, this)
          as Map<String, dynamic>);
  static GUserOrderByInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GUserOrderByInput.serializer, json);
}

abstract class GUserProfileOrderByInput
    implements
        Built<GUserProfileOrderByInput, GUserProfileOrderByInputBuilder> {
  GUserProfileOrderByInput._();

  factory GUserProfileOrderByInput(
          [Function(GUserProfileOrderByInputBuilder b) updates]) =
      _$GUserProfileOrderByInput;

  GsortOrder? get avatar;
  GsortOrder? get bio;
  GsortOrder? get location;
  GsortOrder? get name;
  GsortOrder? get updatedAt;
  GsortOrder? get userId;
  static Serializer<GUserProfileOrderByInput> get serializer =>
      _$gUserProfileOrderByInputSerializer;
  Map<String, dynamic> toJson() =>
      (_i2.serializers.serializeWith(GUserProfileOrderByInput.serializer, this)
          as Map<String, dynamic>);
  static GUserProfileOrderByInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers
          .deserializeWith(GUserProfileOrderByInput.serializer, json);
}

abstract class GUserProfileRelationFilter
    implements
        Built<GUserProfileRelationFilter, GUserProfileRelationFilterBuilder> {
  GUserProfileRelationFilter._();

  factory GUserProfileRelationFilter(
          [Function(GUserProfileRelationFilterBuilder b) updates]) =
      _$GUserProfileRelationFilter;

  @BuiltValueField(wireName: 'is')
  GUserProfileWhereInput? get Gis;
  GUserProfileWhereInput? get isNot;
  static Serializer<GUserProfileRelationFilter> get serializer =>
      _$gUserProfileRelationFilterSerializer;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
      GUserProfileRelationFilter.serializer, this) as Map<String, dynamic>);
  static GUserProfileRelationFilter? fromJson(Map<String, dynamic> json) =>
      _i2.serializers
          .deserializeWith(GUserProfileRelationFilter.serializer, json);
}

abstract class GUserProfileUpdateInput
    implements Built<GUserProfileUpdateInput, GUserProfileUpdateInputBuilder> {
  GUserProfileUpdateInput._();

  factory GUserProfileUpdateInput(
          [Function(GUserProfileUpdateInputBuilder b) updates]) =
      _$GUserProfileUpdateInput;

  String? get avatar;
  String? get bio;
  String? get location;
  String? get name;
  static Serializer<GUserProfileUpdateInput> get serializer =>
      _$gUserProfileUpdateInputSerializer;
  Map<String, dynamic> toJson() =>
      (_i2.serializers.serializeWith(GUserProfileUpdateInput.serializer, this)
          as Map<String, dynamic>);
  static GUserProfileUpdateInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GUserProfileUpdateInput.serializer, json);
}

abstract class GUserProfileWhereInput
    implements Built<GUserProfileWhereInput, GUserProfileWhereInputBuilder> {
  GUserProfileWhereInput._();

  factory GUserProfileWhereInput(
          [Function(GUserProfileWhereInputBuilder b) updates]) =
      _$GUserProfileWhereInput;

  BuiltList<GUserProfileWhereInput>? get AND;
  BuiltList<GUserProfileWhereInput>? get NOT;
  BuiltList<GUserProfileWhereInput>? get OR;
  GStringFilter? get avatar;
  GStringFilter? get bio;
  GStringFilter? get location;
  GStringFilter? get name;
  GUserRelationFilter? get user;
  GStringFilter? get userId;
  static Serializer<GUserProfileWhereInput> get serializer =>
      _$gUserProfileWhereInputSerializer;
  Map<String, dynamic> toJson() =>
      (_i2.serializers.serializeWith(GUserProfileWhereInput.serializer, this)
          as Map<String, dynamic>);
  static GUserProfileWhereInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GUserProfileWhereInput.serializer, json);
}

abstract class GUserRelationFilter
    implements Built<GUserRelationFilter, GUserRelationFilterBuilder> {
  GUserRelationFilter._();

  factory GUserRelationFilter(
      [Function(GUserRelationFilterBuilder b) updates]) = _$GUserRelationFilter;

  @BuiltValueField(wireName: 'is')
  GUserWhereInput? get Gis;
  GUserWhereInput? get isNot;
  static Serializer<GUserRelationFilter> get serializer =>
      _$gUserRelationFilterSerializer;
  Map<String, dynamic> toJson() =>
      (_i2.serializers.serializeWith(GUserRelationFilter.serializer, this)
          as Map<String, dynamic>);
  static GUserRelationFilter? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GUserRelationFilter.serializer, json);
}

class GUserSecurityCompareType extends EnumClass {
  const GUserSecurityCompareType._(String name) : super(name);

  static const GUserSecurityCompareType PASSWORD =
      _$gUserSecurityCompareTypePASSWORD;

  static const GUserSecurityCompareType PHONE_SMS_CODE =
      _$gUserSecurityCompareTypePHONE_SMS_CODE;

  static Serializer<GUserSecurityCompareType> get serializer =>
      _$gUserSecurityCompareTypeSerializer;
  static BuiltSet<GUserSecurityCompareType> get values =>
      _$gUserSecurityCompareTypeValues;
  static GUserSecurityCompareType valueOf(String name) =>
      _$gUserSecurityCompareTypeValueOf(name);
}

abstract class GUserWhereInput
    implements Built<GUserWhereInput, GUserWhereInputBuilder> {
  GUserWhereInput._();

  factory GUserWhereInput([Function(GUserWhereInputBuilder b) updates]) =
      _$GUserWhereInput;

  BuiltList<GUserWhereInput>? get AND;
  BuiltList<GUserWhereInput>? get NOT;
  BuiltList<GUserWhereInput>? get OR;
  GDateTimeFilter? get createdAt;
  GStringFilter? get id;
  GUserProfileRelationFilter? get moments;
  GStringFilter? get phone;
  GUserProfileRelationFilter? get profile;
  GStringFilter? get username;
  static Serializer<GUserWhereInput> get serializer =>
      _$gUserWhereInputSerializer;
  Map<String, dynamic> toJson() =>
      (_i2.serializers.serializeWith(GUserWhereInput.serializer, this)
          as Map<String, dynamic>);
  static GUserWhereInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GUserWhereInput.serializer, json);
}

abstract class GUserWhereUniqueInput
    implements Built<GUserWhereUniqueInput, GUserWhereUniqueInputBuilder> {
  GUserWhereUniqueInput._();

  factory GUserWhereUniqueInput(
          [Function(GUserWhereUniqueInputBuilder b) updates]) =
      _$GUserWhereUniqueInput;

  String? get id;
  String? get phone;
  String? get username;
  static Serializer<GUserWhereUniqueInput> get serializer =>
      _$gUserWhereUniqueInputSerializer;
  Map<String, dynamic> toJson() =>
      (_i2.serializers.serializeWith(GUserWhereUniqueInput.serializer, this)
          as Map<String, dynamic>);
  static GUserWhereUniqueInput? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GUserWhereUniqueInput.serializer, json);
}

class GsortOrder extends EnumClass {
  const GsortOrder._(String name) : super(name);

  static const GsortOrder asc = _$gsortOrderasc;

  static const GsortOrder desc = _$gsortOrderdesc;

  static Serializer<GsortOrder> get serializer => _$gsortOrderSerializer;
  static BuiltSet<GsortOrder> get values => _$gsortOrderValues;
  static GsortOrder valueOf(String name) => _$gsortOrderValueOf(name);
}
