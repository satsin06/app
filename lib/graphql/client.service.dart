import 'package:ferry/ferry.dart';
import 'package:ferry_hive_store/ferry_hive_store.dart';
import 'package:get/get.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:hive/hive.dart';

class GraphQLClientService extends GetxService {
  late Client _$client;
  late Box<dynamic> _$hiveBox;

  HttpLink get link => HttpLink('http://127.0.0.1:3000');
  Client get client => _$client;
  Box<dynamic> get hiveBox => _$hiveBox;

  static Future<GraphQLClientService> init() async {
    return GraphQLClientService().._$hiveBox = await Hive.openBox('graphql');
  }

  @override
  void onInit() {
    final store = HiveStore(_$hiveBox);
    final cache = Cache(store: store);

    _$client = Client(link: link, cache: cache);

    super.onInit();
  }
}
