import 'dart:io';
import 'dart:math';

import 'package:crypto/crypto.dart' as crypto;
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';

import '../api.dart';
import '../models/storage.dart';

class StorageService {
  final API api;

  const StorageService(this.api);

  /// Query a storage info.
  ///
  /// - [id] The storage id.
  /// - [headers] Generate the storage URL request bound headers.
  /// - [query] Generate the storage URL request query parameters.
  Future<Storage> query(String id, {String? headers, String? query}) async {
    const String document = r'''
      query Storage($storageId: String!, $headers: String, $query: String) {
        storage(id: $storageId) {
          createdAt
          id
          isUploaded
          location
          url(headers: $headers, query: $query)
        }
      }
    ''';
    final Map<String, String?> variables = {
      'storageId': id,
      'headers': headers,
      'query': query,
    };

    final Map<String, dynamic> data = await api.request(
        query: document, variables: variables, operationName: 'Storage');

    return Storage.fromJson(data['storage']);
  }

  /// Upload a file to storage.
  ///
  /// - [file] The file to upload.
  /// - [headers] Generate the storage URL request bound headers.
  /// - [query] Generate the storage URL request query parameters.
  Future<Storage> upload(File file, {String? headers, String? query}) async {
    const String document = r'''
      mutation CreateUploadStorageMetadata($md5: String!, $mimeType: String!, $size: Int!) {
        createUploadStorageMetadata(md5: $md5, mimeType: $mimeType, size: $size) {
          headers
          id
          url
        }
      }
    ''';

    final _FileMetadataHelper fileMetadata = _FileMetadataHelper(file);
    final Map<String, dynamic> variables = {
      'md5': await fileMetadata.md5,
      'mimeType': await fileMetadata.mimeType,
      'size': await fileMetadata.length,
    };
    final Map<String, dynamic> result = await api.request(
        query: document,
        variables: variables,
        operationName: 'CreateUploadStorageMetadata');
    final UploadStorageMetadata metadata =
        UploadStorageMetadata.fromJson(result['createUploadStorageMetadata']);

    final request = http.StreamedRequest('PUT', Uri.parse(metadata.url))
      ..contentLength = await fileMetadata.length
      ..headers.addAll(Uri.splitQueryString(metadata.headers));

    file.openRead().listen(request.sink.add,
        onDone: request.sink.close, onError: request.sink.addError);

    final http.StreamedResponse streamedResponse =
        await api.client.send(request);
    final http.Response response =
        await http.Response.fromStream(streamedResponse);

    if (response.statusCode != 200) {
      throw const FormatException('Upload failed');
    }

    return await this.query(metadata.id, headers: headers, query: query);
  }
}

class _FileMetadataHelper {
  final File file;
  _FileMetadataHelper(this.file);

  /// MD5
  String? _md5;
  Future<String> get md5 async {
    if (_md5 != null) return _md5!;

    return _md5 = (await crypto.md5.bind(file.openRead()).first).toString();
  }

  /// Length
  int? _length;
  Future<int> get length async {
    if (_length != null) return _length!;

    return _length = await file.length();
  }

  /// MIME type
  String? _mimeType;
  Future<String> get mimeType async {
    if (_mimeType != null) return _mimeType!;

    final List<List<int>> result =
        await file.openRead(0, min(2048, await length)).toList();
    final List<int> headerBytes = result.expand((element) => element).toList();

    return lookupMimeType(file.path, headerBytes: headerBytes) ??
        'application/octet-stream';
  }
}
