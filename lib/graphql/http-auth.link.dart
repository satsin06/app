import 'package:get/get.dart' hide Response;
import 'package:gql_http_link/gql_http_link.dart';
import "package:gql_link/gql_link.dart";
import 'package:gql_exec/gql_exec.dart';

import '../app.service.dart';
import 'fragments.dart';

class HttpAuthLink extends Link {
  final AppService appService = Get.find<AppService>();
  final String headerKeyName = 'Authorization';

  @override
  Stream<Response> request(Request request, [NextLink? forward]) async* {
    final Request _$request = await transform(request);
    yield* forward!(_$request);
  }

  Future<Request> transform(Request request) async {
    final GAuthorizationTokenFragmentData? authorizationToken =
        await getToken();
    if (authorizationToken == null) {
      return request;
    }

    return request
        .updateContextEntry<HttpLinkHeaders>((headers) => HttpLinkHeaders(
              headers: <String, String>{
                ...headers?.headers ?? <String, String>{},
                headerKeyName: authorizationToken.token,
              },
            ));
  }

  Future<GAuthorizationTokenFragmentData?> getToken() async {
    final Map<String, dynamic>? authorizationTokenJson =
        appService.cache.get(headerKeyName, defaultValue: null);
    if (authorizationTokenJson == null) {
      return null;
    }
    final authorizationToken =
        GAuthorizationTokenFragmentData.fromJson(authorizationTokenJson);
    if (authorizationToken == null) {
      return null;
    }

    // TODO: 完成Token 过期判断与自动刷新

    return authorizationToken;
  }

  Future<void> updateToken(GAuthorizationTokenFragmentData authorizationToken) {
    return appService.cache.put(headerKeyName, authorizationToken.toJson());
  }
}
