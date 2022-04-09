// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_storage_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadStorageMetadata _$UploadStorageMetadataFromJson(
        Map<String, dynamic> json) =>
    UploadStorageMetadata(
      id: json['id'] as String,
      url: json['url'] as String,
      headersString: json['headers'] as String,
    );

Map<String, dynamic> _$UploadStorageMetadataToJson(
        UploadStorageMetadata instance) =>
    <String, dynamic>{
      'id': instance.id,
      'headers': instance.headersString,
      'url': instance.url,
    };
