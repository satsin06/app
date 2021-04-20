import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'graphql/client.service.dart';

class AppService extends GetxService {
  AppService._({
    required this.cache,
  });

  final Box<dynamic> cache;

  static Future<AppService> init() async {
    if (Get.isRegistered<AppService>()) {
      return Get.find<AppService>();
    }

    await Hive.initFlutter('database');

    final Box hiveBox = await Hive.openBox('cache');
    final AppService instance =
        Get.put<AppService>(AppService._(cache: hiveBox));

    await Get.putAsync(() => GraphQLClientService.init());

    return instance;
  }
}
