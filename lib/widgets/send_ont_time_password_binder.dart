import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/api.dart';
import '../providers/api.dart';

/// Send One-time password widget builder.
///
/// This widget is used to build the send One-time password button.
///
/// - [context] is the context of the widget.
/// - [sending] is the sending state of the widget.
/// - [onPressed] is the callback when the button is pressed.
/// - [seconds] is the seconds of the countdown.
typedef SendOntTimePasswordWidgetBuilder = Widget Function(
  BuildContext context, {
  required bool sending,
  required int seconds,
  required VoidCallback onPressed,
});

/// Send One-time password error notifier.
///
/// This notifier is used to notify the error of the send One-time password.
typedef SendOntTimePasswordErrorNotifier = void
    Function(BuildContext context, Object error, [StackTrace? stackTrace]);

/// Default send One-time password widget builder.
Widget defaultSendOneTimePasswordWidgetBuilder(
  BuildContext context, {
  required bool sending,
  required int seconds,
  required VoidCallback onPressed,
}) {
  /// If [sending] is true, return a [CircularProgressIndicator]
  if (sending) {
    return const TextButton(
      onPressed: null,
      child: SizedBox.square(
        child: CircularProgressIndicator(strokeWidth: 2.0),
        dimension: 20.0,
      ),
    );
  }

  /// If [countDown] is 0, return a [TextButton]
  if (seconds == 0) {
    return TextButton(
      onPressed: onPressed,
      child: const Text('获取验证码'),
    );
  }

  /// If [countDown] is not 0
  return TextButton(
    onPressed: null,
    child: Text('$seconds s'),
  );
}

/// Send One-time password binder widget.
class SendOntTimePasswordBinder extends ConsumerStatefulWidget {
  final String? email;
  final String? phone;
  final bool isEmail;
  final bool isPhone;
  final int seconds;
  final SendOntTimePasswordWidgetBuilder builder;
  final SendOntTimePasswordErrorNotifier? errorNotifier;

  const SendOntTimePasswordBinder.forTarget({
    Key? key,
    this.email,
    this.phone,
    this.builder = defaultSendOneTimePasswordWidgetBuilder,
    this.seconds = 60,
    this.errorNotifier,
  })  : isEmail = false,
        isPhone = false,
        super(key: key);

  const SendOntTimePasswordBinder.forAuth({
    Key? key,
    bool phone = false,
    bool email = false,
    required this.builder,
    this.seconds = 60,
    this.errorNotifier,
  })  : email = null,
        phone = null,
        isEmail = email,
        isPhone = phone,
        super(key: key);

  @override
  ConsumerState<SendOntTimePasswordBinder> createState() =>
      _SendOntTimePasswordBinderState();
}

class _SendOntTimePasswordBinderState
    extends ConsumerState<SendOntTimePasswordBinder> {
  Timer? _timer;
  late int _countdown;
  late bool _sending;
  late final Duration _duration;

  @override
  void initState() {
    _countdown = 0;
    _sending = false;
    _duration = const Duration(seconds: 1);

    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_timer?.isActive == true) {
      _timer?.cancel();
    }

    _countdown = 0;
    _sending = false;

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(
      context,
      sending: _sending,
      seconds: _countdown,
      onPressed: _onPressed,
    );
  }

  void _onPressed() {
    /// If [_countdown] is not 0, return.
    if (_countdown > 0) return;

    // Send One-time password
    final bool forTarget = widget.isEmail == false && widget.isPhone == false;
    return _onSendOneTimePassword(
      forTarget ? _forTargetSender : _forAuthSender,
    );
  }

  void _onSendOneTimePassword(
      Future<void> Function(OneTimePasswordService) sender) async {
    // Find the One-time password service
    final OneTimePasswordService service =
        ref.watch(apiProvider).oneTimePassword;

    try {
      // Set sending state.
      setState(() => _sending = true);

      // run sender.
      await sender.call(service);

      _timer?.cancel();
      _timer = Timer.periodic(_duration, _timerPeriodicCallback);
    } catch (error, stackTrace) {
      widget.errorNotifier?.call(context, error, stackTrace);

      rethrow;
    } finally {
      setState(() => _sending = false);
    }
  }

  void _timerPeriodicCallback(Timer timer) {
    setState(() {
      _countdown = widget.seconds - timer.tick;
      if (_countdown <= 0) {
        timer.cancel();
        _timer = null;
      }
    });
  }

  Future<void> _forTargetSender(OneTimePasswordService service) => service.send(
      email: widget.email,
      phone:
          widget.phone?.isEmpty == true ? null : _formatPhone(widget.phone!));

  Future<void> _forAuthSender(OneTimePasswordService service) =>
      service.sendForAuth(email: widget.isEmail, phone: widget.isPhone);

  String _formatPhone(String phone) {
    if (phone.startsWith(RegExp(r'\+\d{1,3}'), 0)) return phone;

    return '+86$phone';
  }
}
