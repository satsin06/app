import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socfony/socfony.dart';

class SocfonyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Socfony socfony = Get.find<Socfony>();
    return GetMaterialApp(
      title: socfony.name,
      home: LoginView(),
    );
  }
}
