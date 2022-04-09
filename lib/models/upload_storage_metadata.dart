import 'dart:collection';

import 'package:json_annotation/json_annotation.dart';

part 'upload_storage_metadata.g.dart';

@JsonSerializable()
class UploadStorageMetadata {
  final String id;

  @JsonKey(name: 'headers')
  final String headersString;

  final String url;

  const UploadStorageMetadata({
    required this.id,
    required this.url,
    required this.headersString,
  });

  factory UploadStorageMetadata.fromJson(Map<String, dynamic> json) =>
      _$UploadStorageMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$UploadStorageMetadataToJson(this);

  @override
  String toString() => toJson().toString();

  /// Parse the headers string into a Map<String, String>
  /// [headersString] is the headers string in the format of
  /// "key1=value1&key2=value2" etc.
  ///
  /// Returns a Map<String, String>
  Map<String, String> get headers =>
      UnmodifiableMapView<String, String>(Uri.splitQueryString(headersString));
}
