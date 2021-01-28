import 'dart:async';

import 'package:get/get.dart';
import 'package:graphql/client.dart';

class Socfony {
  Socfony._({this.endpoint}) {
    this.graphqlClient = createGraphQLClient(endpoint);
    Get.put(this, permanent: true);
  }

  factory Socfony({String endpoint}) {
    try {
      return Get.find<Socfony>();
    } catch (_) {
      return Socfony._(endpoint: endpoint);
    }
  }

  static createGraphQLClient(String endpoint, [FutureOr<String> getToken()]) {
    var link = HttpLink(endpoint);
    if (getToken is Function) {
      final authLink = AuthLink(getToken: getToken, headerKey: 'Authorization');
      link = authLink.concat(link);
    }

    return GraphQLClient(link: link, cache: GraphQLCache());
  }

  String endpoint;
  GraphQLClient graphqlClient;
}
