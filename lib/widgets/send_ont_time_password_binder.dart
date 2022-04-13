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
/// - [onPressed] is the callback when the button is pressed. Tips: sending
///  is true or secounds is not 0, the button will be disabled.
/// - [seconds] is the seconds of the countdown.
typedef SendOntTimePasswordWidgetBuilder = Widget Function(
  BuildContext context, {
  required bool sending,
  required int seconds,
  VoidCallback? onPressed,
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
  VoidCallback? onPressed,
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
  if (seconds == 0 && onPressed != null) {
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

class _CounterNotifier extends StateNotifier<int> {
  _CounterNotifier(this.duration) : super(0);

  final int duration;
  Timer? _timer;

  int get counter => state;

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

  void start() {
    state = duration;
    _timer?.cancel();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      _timerPeriodicCallback,
    );
  }

  void cancel([Timer? timer]) {
    state = 0;
    timer?.cancel();
    _timer?.cancel();
    _timer = null;
  }

  void _timerPeriodicCallback(Timer timer) {
    if (timer.tick >= duration) {
      return cancel(timer);
    }

    state = duration - timer.tick;
  }
}

final AutoDisposeStateNotifierProviderFamily<_CounterNotifier, int, int>
    _$CounterNotifierProvider =
    StateNotifierProvider.autoDispose.family<_CounterNotifier, int, int>(
  (Ref ref, int duration) => _CounterNotifier(duration),
);

final AutoDisposeStateProvider<bool> _$SendingProvider =
    StateProvider.autoDispose((Ref ref) => false);

/// Send One-time password binder widget.
class SendOntTimePasswordBinder extends ConsumerWidget {
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
    this.builder = defaultSendOneTimePasswordWidgetBuilder,
    this.seconds = 60,
    this.errorNotifier,
  })  : email = null,
        phone = null,
        isEmail = email,
        isPhone = phone,
        super(key: key);

  AutoDisposeStateNotifierProvider<_CounterNotifier, int>
      get $CounterProvider => _$CounterNotifierProvider(seconds);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool sending = ref.watch(_$SendingProvider);
    final int counter = ref.watch($CounterProvider);

    VoidCallback? onPressed;
    if (sending == false && counter == 0) {
      onPressed = _createOnPressed(context, ref);
    }

    return builder(
      context,
      sending: sending,
      seconds: counter,
      onPressed: onPressed,
    );
  }

  VoidCallback _createOnPressed(BuildContext context, WidgetRef ref) {
    return () async {
      /// Find counter notifier
      final _CounterNotifier counterNotifier =
          ref.read($CounterProvider.notifier);

      /// If sending is true, or the timer is active, return.
      final bool sending = ref.read(_$SendingProvider);
      if (sending || counterNotifier.counter > 0) {
        return;
      }

      /// Set sending to true.
      ref.read(_$SendingProvider.notifier).state = true;

      /// Find One-time password service.
      final OneTimePasswordService service =
          ref.read($APIProvider).oneTimePassword;

      /// Find sender.
      final bool forTarget = isEmail == false && isPhone == false;
      final Future<void> Function(OneTimePasswordService) sender =
          forTarget ? _forTargetSender : _forAuthSender;

      try {
        /// Send One-time password.
        await sender.call(service);

        /// Counter start.
        counterNotifier.start();
      } catch (error, stackTrace) {
        errorNotifier?.call(context, error, stackTrace);
        rethrow;
      } finally {
        /// Set sending to false.
        ref.read(_$SendingProvider.notifier).state = false;
      }
    };
  }

  Future<void> _forTargetSender(OneTimePasswordService service) =>
      service.send(email: email, phone: phone);

  Future<void> _forAuthSender(OneTimePasswordService service) =>
      service.sendForAuth(phone: isPhone, email: isEmail);
}
