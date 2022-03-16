// Copyright (c) 2021, Odroe Inc. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

import 'app.dart';
import 'hive/init.dart';
import 'provider/provider.dart';

/// The main entry point for the application.
void main() async {
  // Ensure that the platform is initialized before the app starts.
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive.
  await hiveInit();

  // Initialize provider.
  await initProvider();

  // Create App instance.
  const Application app = Application();

  // Run the app.
  runApp(app);
}
