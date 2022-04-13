import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../router/route_names.dart' as route_names
    show settingSecurityEmail;
import '../../../../api/api.dart';
import '../../../../widgets/card_wrapper.dart';
import 'account_security_health_fetch_card.dart';

class EmailCard extends ConsumerWidget {
  const EmailCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ProviderListenable<AccountSecurityHealthResult> provider =
        $AccountSecurityHealthProvider.select(
      (element) => element.singleWhere(
        (element) => element.field == UserSecurityFields.email,
      ),
    );
    final AccountSecurityHealthResult health = ref.watch(provider);
    if (health.status == false) {
      return const _DefaultJumpToEmailSecurityCard();
    }

    return AccountSecurityHealthFetchCard(
      child: CardWrapper(
        child: ListTile(
          leading: const Icon(Icons.email),
          title: Text(health.message!),
          trailing: const Icon(Icons.chevron_right),
        ),
      ),
    );
  }
}

class _DefaultJumpToEmailSecurityCard extends StatelessWidget {
  const _DefaultJumpToEmailSecurityCard({Key? key}) : super(key: key);

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
            child: Text('设置安全邮箱', style: buttonStyle),
          ),
        ),
        onTap: () => _jump(context),
      ),
    );
  }

  void _jump(BuildContext context) {
    context.pushNamed(route_names.settingSecurityEmail);
  }
}
