// Copyright (c) 2021, Odroe Inc. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  AppState._();

  static final AppState _instance = AppState._();
  factory AppState() => _instance;

  static Future<void> loadTheme() async {}

  Color themePrimaryColor = const Color(0xff5e6ce7);
  ThemeMode themeMode = ThemeMode.system;

  Key _key = UniqueKey();
  Key get key => _key;

  void save() => notifyListeners();

  void restart() {
    _key = UniqueKey();
    notifyListeners();
  }
}
