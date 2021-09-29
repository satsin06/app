import 'package:flutter/material.dart';

import 'app.dart';
import 'store/register.dart';


void main() {
  // Register the store.
  storeRegister();

  // Run the app.
  runApp(const App());
}
