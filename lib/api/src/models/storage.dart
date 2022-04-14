import 'package:json_annotation/json_annotation.dart';

part 'storage.g.dart';

@JsonSerializable(createToJson: false)
class Storage {
  final String id;
  final bool isUploaded;
  final String location;
  final DateTime createdAt;
  final String url;

  const Storage({
    required this.id,
    required this.location,
    required this.createdAt,
    required this.url,
    this.isUploaded = false,
  });

  factory Storage.fromJson(Map<String, dynamic> json) =>
      _$StorageFromJson(json);
}

@JsonSerializable(createToJson: false)
class UploadStorageMetadata {
  final String id;
  final String headers;
  final String url;

  const UploadStorageMetadata({
    required this.id,
    required this.url,
    required this.headers,
  });

  factory UploadStorageMetadata.fromJson(Map<String, dynamic> json) =>
      _$UploadStorageMetadataFromJson(json);
}
