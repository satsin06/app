import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';

class Socfony extends GetxService {
  /// Server endpoint
  String endpoint;

  /// GraphQL client
  GraphQLClient graphqlClient;

  /// App logo
  Image logo;

  /// App name
  String name;

  /// Socfony constructor
  Socfony({
    @required this.endpoint,
    this.logo,
    this.name = 'Socfony',
  }) {
    Get.put<Socfony>(this);
  }

  @override
  onInit() {
    graphqlClient = createGraphQLClient(endpoint);
    super.onInit();
  }

  static createGraphQLClient(String endpoint, [FutureOr<String> getToken()]) {
    var link = HttpLink(endpoint);
    if (getToken is Function) {
      final authLink = AuthLink(getToken: getToken, headerKey: 'Authorization');
      link = authLink.concat(link);
    }

    return GraphQLClient(link: link, cache: GraphQLCache());
  }
}
