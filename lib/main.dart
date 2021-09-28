import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socfony/models/verification_code.response.dart';

import 'app.dart';

void main() {
  runApp(
    MultiProvider(
      child: const App(),
      providers: [
        ChangeNotifierProvider(create: (_) => VerificationCodeResponse()),
      ],
    ),
  );
}
