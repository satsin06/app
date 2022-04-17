// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Moment _$MomentFromJson(Map<String, dynamic> json) => Moment(
      id: json['id'] as String,
      userId: json['userId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      title: json['title'] as String?,
      content: json['content'] as String?,
      storages: (json['storages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );
