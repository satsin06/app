import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socfony/pages/main/main.controller.dart';

class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Main'),
      ),
    );
  }
}