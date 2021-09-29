// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GraphQLResponse _$GraphQLResponseFromJson(Map<String, dynamic> json) =>
    GraphQLResponse(
      errors: (json['errors'] as List<dynamic>?)
          ?.map((e) => GraphQLError.fromJson(e as Map<String, dynamic>))
          .toList(),
      data: json['data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$GraphQLResponseToJson(GraphQLResponse instance) =>
    <String, dynamic>{
      'errors': instance.errors,
      'data': instance.data,
    };
