// Copyright (c) 2021, Odroe Inc. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';

const List<String> headers = [
  '╔════════════════════════════════════════╗',
  '║                Socfony                 ║',
  '╚════════════════════════════════════════╝',
  '                    ♻️                    '
];

/// The main entry point for the application.
void main() {
  // Output The following message to the console:
  for (String line in headers) {
    print.call(line);
  }

  runApp(
    const ProviderScope(
      child: Application(),
    ),
  );
}
