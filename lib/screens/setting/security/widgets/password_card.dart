import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../models/account_security_health.dart';
import '../../../../widgets/card_wrapper.dart';
import '../../../../router/route_names.dart' as route_names
    show settingSecurityPassword;
import '../providers.dart';
import 'load_health_widget.dart';

class PasswordCard extends LoadHealthWidget {
  const PasswordCard({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, WidgetRef ref) {
    final ProviderListenable<AccountSecurityHealthResult> provider =
        healthProvider
            .select(HealthNotofier.selector(UserSecurityFields.password));
    final AccountSecurityHealthResult health = ref.watch(provider);

    final ThemeData theme = Theme.of(context);
    final TextStyle? buttonStyle = theme.textTheme.button?.copyWith(
      color: theme.primaryColor,
    );

    final String text = health.status ? '更改密码' : '设置密码';

    return GestureDetector(
      child: CardWrapper(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Center(
          child: Text(text, style: buttonStyle),
        ),
      ),
      onTap: () => onChangePassword(context),
    );
  }

  void onChangePassword(BuildContext context) {
    context.pushNamed(route_names.settingSecurityPassword);
  }
}
