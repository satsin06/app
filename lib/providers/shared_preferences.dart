import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final $SharedPreferencesProvider = FutureProvider<SharedPreferences>(
  (Ref ref) async => await SharedPreferences.getInstance(),
);
