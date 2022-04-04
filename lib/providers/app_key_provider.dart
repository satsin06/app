import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appKeyProvider = StateProvider<Key>(
  (Ref ref) => UniqueKey(),
);
