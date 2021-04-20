import 'package:flutter/material.dart';

import 'app.service.dart';
import 'app.view.dart';

Future<void> main() async {
  await AppService.init();
  runApp(AppView());
}
