import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';

import '../../../providers/graphql_provider.dart';
import 'login_message_provider.dart';

final loginSendingProvider = StateProvider.autoDispose<bool>((ref) => false);

const String _sendOtpDocument = r'''
mutation SendOTP($phone: String!) {
  sendOTP(type: SMS, value: $phone)
}
''';
MutationOptions<void> _createSendOtpOptions(String phone) {
  return MutationOptions(
    document: gql(_sendOtpDocument),
    variables: <String, dynamic>{
      'phone': phone,
    },
    fetchPolicy: FetchPolicy.networkOnly,
  );
}

class LoginOtpNotifier extends StateNotifier<bool> {
  LoginOtpNotifier(this.ref) : super(false);

  final Ref ref;

  bool get hasSending => state;

  void setSending(bool value) {
    state = value;
  }

  Future<bool> send(String phone) async {
    setSending(true);

    final client = ref.read(graphqlClientProvider);
    final options = _createSendOtpOptions('+86' + phone);

    try {
      final result = await client.mutate(options);
      if (result.hasException) {
        throw result.exception!;
      }

      return true;
    } catch (e) {
      ref.read(loginPasswordMessageProvider.state).state = '验证码发送失败';
    } finally {
      setSending(false);
    }

    return false;
  }
}

final loginOtpProvider =
    StateProvider.autoDispose((ref) => LoginOtpNotifier(ref));
