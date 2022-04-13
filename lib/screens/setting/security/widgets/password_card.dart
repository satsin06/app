import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:socfony/api/api.dart';

import '../../../../widgets/card_wrapper.dart';
import '../../../../router/route_names.dart' as route_names
    show settingSecurityPassword;
import 'account_security_health_fetch_card.dart';

class PasswordCard extends ConsumerWidget {
  const PasswordCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);
    final TextStyle? buttonStyle = theme.textTheme.button?.copyWith(
      color: theme.primaryColor,
    );

    final ProviderListenable<AccountSecurityHealthResult> provider =
        $AccountSecurityHealthProvider.select((element) => element.singleWhere(
            (element) => element.field == UserSecurityFields.password));
    final AccountSecurityHealthResult health = ref.watch(provider);
    final String text = health.status ? '更改密码' : '设置密码';

    return AccountSecurityHealthFetchCard(
      child: GestureDetector(
        child: CardWrapper(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Center(
            child: Text(text, style: buttonStyle),
          ),
        ),
        onTap: () => onChangePassword(context),
      ),
    );
  }

  void onChangePassword(BuildContext context) {
    context.pushNamed(route_names.settingSecurityPassword);
  }
}
