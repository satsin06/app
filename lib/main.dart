// Copyright (c) 2021, Odroe Inc. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'app.dart';
import 'authorization_manager/authorization_manager.dart';
import 'hive/init.dart';
import 'provider/authorization_controller.dart';
import 'provider/provider.dart';

/// The main entry point for the application.
void main() async {
  // Ensure that the platform is initialized before the app starts.
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Authorization manager.
  await initAuthorizationManager();

  // Initialize Hive.
  await hiveInit();

  // Initialize provider.
  await initProvider();

  // Create App instance.
  const Application app = Application();

  // Run the app.
  runApp(app);
}

Future<void> initAuthorizationManager() async {
  Future<String> getStoreDirectory() async {
    final supportDirectory = await getApplicationSupportDirectory();

    return supportDirectory.path + '/authorization_manager';
  }

  await authorizationManager.initialize(
    getStoreDirectory: getStoreDirectory,
    onInitialize: AuthorizationController.initialize,
    onRefresh: AuthorizationController.requestRefresh,
  );
}
