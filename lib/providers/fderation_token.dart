import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/fderation_token.dart';

class FderationTokenNotifier extends StateNotifier<FederationToken> {
  FderationTokenNotifier(FederationToken state) : super(state);
}
