import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socfony/providers/api.dart';

import '../api/api.dart';

class StorageOptions {
  final String id;
  final String? headers;
  final String? query;

  const StorageOptions(this.id, {this.headers, this.query});

  @override
  int get hashCode {
    super.hashCode;
    int idHashCode = id.hashCode;

    if (headers != null) idHashCode ^= headers.hashCode;
    if (query != null) idHashCode ^= query.hashCode;

    return idHashCode;
  }

  @override
  bool operator ==(Object other) => hashCode == other.hashCode;
}

final $StorageProvider =
    FutureProvider.autoDispose.family<Storage, StorageOptions>(
  (Ref ref, StorageOptions options) async {
    final StorageService service = ref.read($APIProvider).storage;

    return await service.query(
      options.id,
      headers: options.headers,
      query: options.query,
    );
  },
);
