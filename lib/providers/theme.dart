import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../theme/theme.dart';
import 'shared_preferences.dart';

class ThemeNotifier extends StateNotifier<Theme> {
  ThemeNotifier(this.ref) : super(const Theme());

  /// riverpod ref
  final Ref ref;

  /// Load theme from shared preferences
  Future<void> load() async {
    /// Get shared preferences instance
    final sharedPreferences = await ref.read($SharedPreferencesProvider.future);

    /// Get theme from shared preferences
    final String? themeString = sharedPreferences.getString('theme');

    state = Theme.fromString(themeString);
  }
}

final $ThemeProvider = StateNotifierProvider<ThemeNotifier, Theme>(
  (Ref ref) => ThemeNotifier(ref),
);
