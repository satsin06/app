import 'dart:convert';

import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../configuration.dart';
import 'response.dart';

class _GraphQLClient extends BaseClient {
  late final Client client;

  _GraphQLClient._() {
    client = Client();
  }

  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    request.headers['authorization'] = token ?? '';
    request.headers['user-agent'] = 'Socfony';

    return client.send(request);
  }

  static Future<GraphQLResponse> request(
      {String? operationName,
      Map<dynamic, dynamic>? variables,
      Map<String, String>? headers,
      required String query,
      required Uri url}) async {
    final client = _GraphQLClient._();
    final response = await client.post(
      url,
      headers: {
        ...?headers,
        'content-type': 'application/json',
      },
      body: jsonEncode({
        'query': query,
        'variables': variables ?? {},
        'operationName': operationName,
      }),
    );
    client.dispose();

    return GraphQLResponse.fromJson(json.decode(response.body));
  }

  void dispose() {
    client.close();
  }
}

final _endpoint = Uri.parse(graphqlEndpoint);

Future<GraphQLResponse> graphql({
  String? operationName,
  Map<dynamic, dynamic>? variables,
  Map<String, String>? headers,
  required String query,
}) {
  return _GraphQLClient.request(
    operationName: operationName,
    variables: variables,
    headers: headers,
    query: query,
    url: _endpoint,
  );
}
