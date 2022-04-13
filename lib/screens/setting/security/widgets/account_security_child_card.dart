import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../router/route_names.dart' as route_names;
import '../../../../api/api.dart';
import '../../../../widgets/card_wrapper.dart';
import 'account_security_health_fetch_card.dart';

class AccountSecurityChildCard extends ConsumerWidget {
  const AccountSecurityChildCard(this.field, {Key? key}) : super(key: key);

  final UserSecurityFields field;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ProviderListenable<AccountSecurityHealthResult> provider =
        $AccountSecurityHealthProvider.select((element) =>
            element.singleWhere((element) => element.field == field));
    final AccountSecurityHealthResult health = ref.watch(provider);

    /// If field is password field, or health is not success,
    /// or health is success but message is null,
    /// then return default card.
    if (health.status == false ||
        health.message == null ||
        field == UserSecurityFields.password) {
      return _DefaultJumpToPhoneSecurityCard(field, health.status);
    }

    return AccountSecurityHealthFetchCard(
      child: CardWrapper(
        child: ListTile(
          leading: icon,
          title: Text(health.message!),
          trailing: TextButton(
            onPressed: () {
              context.pushNamed(route_names.settingSecurityPhone);
            },
            child: const Text('更换'),
          ),
        ),
      ),
    );
  }

  Icon get icon {
    if (field == UserSecurityFields.phone) return const Icon(Icons.smartphone);

    return const Icon(Icons.email);
  }
}

class _DefaultJumpToPhoneSecurityCard extends StatelessWidget {
  const _DefaultJumpToPhoneSecurityCard(this.field, this.status, {Key? key})
      : super(key: key);

  final UserSecurityFields field;
  final bool status;

  String get prefix => status == true ? '更换' : '设置';
  String get suffix {
    switch (field) {
      case UserSecurityFields.phone:
        return '手机号码';
      case UserSecurityFields.email:
        return '电子邮箱';
      case UserSecurityFields.password:
      default:
        return '密码';
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle? buttonStyle = theme.textTheme.button?.copyWith(
      color: theme.primaryColor,
    );

    return AccountSecurityHealthFetchCard(
      child: GestureDetector(
        child: CardWrapper(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Center(
            child: Text(prefix + suffix, style: buttonStyle),
          ),
        ),
        onTap: () => _jump(context),
      ),
    );
  }

  void _jump(BuildContext context) {
    context.pushNamed(_routes[field]);
  }

  get _routes => {
        UserSecurityFields.email: route_names.settingSecurityEmail,
        UserSecurityFields.phone: route_names.settingSecurityPhone,
        UserSecurityFields.password: route_names.settingSecurityPassword,
      };
}
