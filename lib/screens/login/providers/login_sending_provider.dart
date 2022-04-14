import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../api/api.dart';
import '../../../providers/api.dart';
import 'login_message_provider.dart';

class LoginOtpNotifier extends StateNotifier<bool> {
  LoginOtpNotifier(this.ref) : super(false);

  final Ref ref;

  bool get hasSending => state;

  void setSending(bool value) {
    state = value;
  }

  Future<bool> send(String phone) async {
    setSending(true);
    final OneTimePasswordService service =
        ref.read($APIProvider).oneTimePassword;

    try {
      service.send(phone: phone);

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
final loginSendingProvider = StateProvider.autoDispose<bool>((ref) => false);
