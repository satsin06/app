import 'package:flutter_riverpod/flutter_riverpod.dart';

class PublishController {
  const PublishController(this.ref);

  final Ref ref;
}

final publishControllerProvider = Provider<PublishController>(
  (Ref ref) => PublishController(ref),
);
