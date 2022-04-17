import 'dart:io';

import '../api.dart';
import '../models/moment.dart';

class MomentService {
  final API api;

  MomentService(this.api);
}

/// Extension of [MomentService] to provide methods to create moment.
extension CreateMomentMethod on MomentService {
  Future<Moment> create({
    String? title,
    String? content,
    List<File>? storages,
  }) async {
    if ((storages?.isEmpty ?? true) &&
        (title?.isEmpty ?? true) &&
        (content?.isEmpty ?? true)) {
      throw ArgumentError('At least one of title, content, storages must be '
          'provided.');
    }

    /// If storage is provided, we need to upload it to the server.
    List<String>? uploadedStorages;
    if (storages?.isNotEmpty ?? false) {
      uploadedStorages = await Future.wait(
        storages!.map((file) async {
          final storage = await api.storage.upload(file);
          return storage.id;
        }).toList(),
      );
    }

    const String query = r'''
mutation CreateMoment($createMomentInput: CreateMomentInput!) {
  createMoment(createMomentInput: $createMomentInput) {
    content
    createdAt
    id
    storages
    title
    userId
  }
}
''';
    final Map<String, dynamic> variables = <String, dynamic>{
      'createMomentInput': <String, dynamic>{
        'title': title,
        'content': content,
        'storages': uploadedStorages,
      },
    };

    final result = await api.request(
      query: query,
      variables: variables,
      operationName: 'CreateMoment',
    );

    print(result);

    return Moment.fromJson(result['createMoment']);
  }
}
