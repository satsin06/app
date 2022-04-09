import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

class CacheManager {
  final Uri _parent;

  CacheManager(String path) : _parent = Uri.directory(path);

  /// Clear cached files
  Future<void> clear() async {
    /// Read directory children and delete them
    Directory.fromUri(_parent).list().listen((FileSystemEntity entity) {
      entity.deleteSync(recursive: true);
    });
  }

  /// Get cache file
  File file(String key) => File(_resolveFilePath(key));

  /// Delete a cached file
  void delete(String key) {
    final File file = File(_resolveFilePath(key));
    if (file.existsSync()) {
      file.deleteSync(recursive: true);
    }
  }

  /// Resolve and SHA245 name of file path
  String _resolveFilePath(String key) {
    final digest = sha256.convert(utf8.encode(key));

    return _parent.resolve(digest.toString()).toFilePath();
  }
}

final cacheManagerProvider = FutureProvider((Ref ref) async {
  final documentDirectory = await getApplicationDocumentsDirectory();

  return CacheManager(documentDirectory.uri.resolve(r'@socfony/cache').path);
});
