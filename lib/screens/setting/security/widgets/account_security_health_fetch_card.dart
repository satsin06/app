import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socfony/api/api.dart';
import 'package:socfony/providers/api.dart';
import 'package:socfony/widgets/card_wrapper.dart';

class AccountSecurityHealthNotifier
    extends StateNotifier<List<AccountSecurityHealthResult>> {
  AccountSecurityHealthNotifier(this.ref)
      : super(
          UserSecurityFields.values
              .map((field) => AccountSecurityHealthResult(field, status: false))
              .toList(),
        );

  final Ref ref;

  update(UserSecurityFields field, {bool? status, String? message}) {
    final List<AccountSecurityHealthResult> oldState = state;
    AccountSecurityHealthResult health = oldState.singleWhere(
      (element) => element.field == field,
      orElse: () =>
          AccountSecurityHealthResult(field, status: false, message: message),
    );
    if (status != null && status != health.status) {
      health = AccountSecurityHealthResult(health.field,
          status: status, message: health.message);
    }
    if (message != null) {
      health = AccountSecurityHealthResult(health.field,
          status: health.status, message: message);
    }

    final index =
        oldState.indexWhere((element) => element.field == health.field);
    if (index == -1) {
      state = List.from(oldState)..add(health);
    } else {
      state = List.from(oldState)
        ..removeAt(index)
        ..add(health);
    }
  }

  Future<void> fetch() async {
    final AccountSecurityService service =
        ref.read($APIProvider).accountSecurity;
    state = await service.health();
  }
}

final AutoDisposeStateNotifierProvider<AccountSecurityHealthNotifier,
        List<AccountSecurityHealthResult>> $AccountSecurityHealthProvider =
    StateNotifierProvider.autoDispose<AccountSecurityHealthNotifier,
        List<AccountSecurityHealthResult>>(
  (ref) => AccountSecurityHealthNotifier(ref),
);

final AutoDisposeFutureProvider<void> _$FetchHealthProvider =
    FutureProvider.autoDispose<void>((ref) async {
  final AccountSecurityHealthNotifier notifier =
      ref.read($AccountSecurityHealthProvider.notifier);
  return await notifier.fetch();
});

class AccountSecurityHealthFetchCard extends ConsumerWidget {
  const AccountSecurityHealthFetchCard({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loader = ref.watch(_$FetchHealthProvider);

    return loader.when<Widget>(
      data: (_) => child,
      error: _errorBuilder,
      loading: _loadingBuilder,
    );
  }

  Widget _loadingBuilder() {
    return const CardWrapper(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Center(
        child: SizedBox.square(
          child: CircularProgressIndicator(
            strokeWidth: 2,
          ),
          dimension: 24,
        ),
      ),
    );
  }

  Widget _errorBuilder(Object error, StackTrace? stack) {
    return const CardWrapper(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Center(
        child: Text('加载失败'),
      ),
    );
  }
}
