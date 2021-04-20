import 'package:ferry/ferry.dart';
import 'package:ferry_hive_store/ferry_hive_store.dart';
import 'package:get/get.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:hive/hive.dart';

import 'http-auth.link.dart';

class GraphQLClientService extends GetxService {
  late Client _$client;
  late Client _$clientWithout;
  late Box<dynamic> _$cache;

  HttpLink get httpLink => HttpLink('http://127.0.0.1:3000');
  HttpAuthLink get httpAuthLink => HttpAuthLink();
  Client get client => _$client;
  Client get clientWithout => _$clientWithout;
  Box get cache => _$cache;

  static Future<GraphQLClientService> init() async {
    return GraphQLClientService().._$cache = await Hive.openBox('graphql');
  }

  @override
  void onInit() {
    final store = HiveStore(this.cache);
    final cache = Cache(store: store);

    _$clientWithout = Client(link: httpLink, cache: cache);
    _$client = Client(link: httpAuthLink.concat(httpLink), cache: cache);

    super.onInit();
  }

  @override
  void onClose() {
    clientWithout.dispose();
    client.dispose();
    cache.close();
    super.onClose();
  }
}
