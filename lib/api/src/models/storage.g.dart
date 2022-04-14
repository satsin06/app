// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Storage _$StorageFromJson(Map<String, dynamic> json) => Storage(
      id: json['id'] as String,
      location: json['location'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      url: json['url'] as String,
      isUploaded: json['isUploaded'] as bool? ?? false,
    );

UploadStorageMetadata _$UploadStorageMetadataFromJson(
        Map<String, dynamic> json) =>
    UploadStorageMetadata(
      id: json['id'] as String,
      url: json['url'] as String,
      headers: json['headers'] as String,
    );
