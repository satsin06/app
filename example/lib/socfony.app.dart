import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socfony/socfony.dart';

class SocfonyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Socfony',
      home: LoginView(),
    );
  }
}
