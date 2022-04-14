import 'dart:convert' show json;
import 'dart:io' show Platform;

import 'package:http/http.dart' as http;

import 'authentication.dart';
import 'services.dart' as services;

class API {
  final Uri endpoint;
  final Authentication auth;
  http.Client client;

  API({
    required this.endpoint,
    this.auth = const Authentication.anonymous(),
    http.Client? client,
  }) : client = client ?? http.Client();

  Future<Map<String, dynamic>> request({
    required String query,
    String? operationName,
    Map<String, dynamic>? variables,
  }) async {
    final String body = json.encode({
      'query': query,
      if (operationName != null) 'operationName': operationName,
      if (variables != null) 'variables': variables,
    });
    final String? token = await auth.reader.call();
    final http.Request request = http.Request('POST', endpoint)
      ..headers.addAll({
        if (token != null) 'authorization': token,
        'accept': 'application/json',
        'content-type': 'application/json',
        'user-agent': 'Socfony/' + Platform.operatingSystemVersion,
      })
      ..body = body;

    final http.Response response = await http.Response.fromStream(
      await client.send(request),
    );
    final result = json.decode(response.body) as Map<String, dynamic>;
    final data = result['data'] as Map<String, dynamic>?;
    final errors = result['errors'] as List<dynamic>?;

    if (errors != null && errors.isNotEmpty) {
      for (final item in errors) {
        throw FormatException(item['message']);
      }
    } else if (data == null || data.isEmpty) {
      throw const FormatException('Invalid response.');
    }

    return data!;
  }

  /// One-time password.
  services.OneTimePasswordService? _oneTimePasswordService;
  services.OneTimePasswordService get oneTimePassword =>
      _oneTimePasswordService ??= services.OneTimePasswordService(this);

  /// Account security.
  services.AccountSecurityService? _accountSecurityService;
  services.AccountSecurityService get accountSecurity =>
      _accountSecurityService ??= services.AccountSecurityService(this);

  /// Access token.
  services.AccessTokenService? _accessTokenService;
  services.AccessTokenService get accessToken =>
      _accessTokenService ??= services.AccessTokenService(this);
}
