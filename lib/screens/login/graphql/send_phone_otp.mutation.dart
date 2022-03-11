import 'package:graphql/client.dart';

import '../../../graphql/client.dart';

const String _sendPhoneOTPDocument = r'''
mutation SendOTP($value: String!) {
  sendOTP(type: SMS, value: $value)
}
''';

MutationOptions _createSendPhoneOTPOptions(String phone) {
  return MutationOptions(
    document: gql(_sendPhoneOTPDocument),
    variables: <String, dynamic>{
      r'value': '+86$phone',
    },
    operationName: r'SendOTP',
  );
}

Future<void> sendPhoneOTP(String phone) async {
  final MutationOptions options = _createSendPhoneOTPOptions(phone);
  final GraphQLClient client = await getGraphQLClient();

  final result = await client.mutate(options);
  if (result.hasException) {
    throw result.exception!.graphqlErrors.isNotEmpty
        ? result.exception!.graphqlErrors.first
        : result.exception!.linkException!;
  }
}
