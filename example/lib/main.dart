import 'package:flutter/material.dart';
import 'package:socfony/socfony.dart';
import 'socfony.app.dart';

void main() {
  Socfony(endpoint: 'http://127.0.0.1:3000');
  runApp(SocfonyApp());
}
