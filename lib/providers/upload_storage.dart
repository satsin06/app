import 'dart:io';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';

import '../models/upload_storage_metadata.dart';
import 'graphql.dart';

final _createUploadStorageMetadataDocumentNode = gql(r'''
mutation CreateUploadStorageMetadata($md5: String!, $mimeType: String!, $size: Int!) {
  createUploadStorageMetadata(md5: $md5, mimeType: $mimeType, size: $size) {
    headers
    id
    url
  }
}
''');

Future<String> _getFileMd5(File file) async {
  final Digest digest = await md5.bind(file.openRead()).first;

  return digest.toString();
}

Future<String> _getFileMimeType(File file) async {
  final List<List<int>> result =
      await file.openRead(0, min(2048, await file.length())).toList();
  final List<int> headerBytes = result.expand((element) => element).toList();

  return lookupMimeType(file.path + '/demo', headerBytes: headerBytes) ??
      'application/octet-stream';
}

Future<MutationOptions<UploadStorageMetadata>>
    _createUploadStorageMetadataOptions(File file) async {
  return MutationOptions<UploadStorageMetadata>(
    document: _createUploadStorageMetadataDocumentNode,
    fetchPolicy: FetchPolicy.noCache,
    variables: <String, dynamic>{
      'md5': await _getFileMd5(file),
      'mimeType': await _getFileMimeType(file),
      'size': await file.length(),
    },
    parserFn: (data) =>
        UploadStorageMetadata.fromJson(data['createUploadStorageMetadata']),
  );
}

Future<UploadStorageMetadata> _requestUploadStorageMetadata(
    File file, GraphQLClient client) async {
  final options = await _createUploadStorageMetadataOptions(file);

  final result = await client.mutate(options);
  thenGraphQLResultException(result);

  return result.parsedData!;
}

Future<bool> _uploadFile(File file, UploadStorageMetadata metadata) async {
  // Create request
  final http.StreamedRequest request = http.StreamedRequest(
    'PUT',
    Uri.parse(metadata.url),
  );
  request.headers.addAll(metadata.headers);
  request.contentLength = await file.length();

  file.openRead().listen(request.sink.add, onDone: () => request.sink.close());

  return (await request.send()).statusCode == 200;
}

Future<UploadStorageMetadata> Function(File) uploadFile(WidgetRef ref) =>
    (File file) async {
      final UploadStorageMetadata metadata =
          await _requestUploadStorageMetadata(
        file,
        ref.read(graphqlClientProvider),
      );

      // Upload file
      if (await _uploadFile(file, metadata)) return metadata;

      throw Exception('Upload failed');
    };
