import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';

import '../../../models/account_security_health.dart';
import '../../../providers/graphql.dart';

class HealthNotofier extends StateNotifier<List<AccountSecurityHealthResult>> {
  HealthNotofier(this.ref) : super(const <AccountSecurityHealthResult>[]);

  final Ref ref;

  void upset(UserSecurityFields field,
      {required bool status, String? message}) {
    final int index = state.indexWhere((element) => element.field == field);

    if (index == -1) {
      state.add(
        AccountSecurityHealthResult(field, status: status, message: message),
      );
      return;
    }

    state[index] = state[index].copyWith(
      status: status,
      message: message,
    );
  }

  Future<void> fetch() async {
    final client = ref.read(graphqlClientProvider);
    final options = QueryOptions<List<AccountSecurityHealthResult>>(
      document: gql(r'''
      query AccountSecurityHealth {
        accountSecurityHealth {
          field
          message
          status
        }
      }
    '''),
      fetchPolicy: FetchPolicy.noCache,
      operationName: 'AccountSecurityHealth',
      parserFn: (Map<String, dynamic> data) =>
          (data['accountSecurityHealth'] as List)
              .map((json) => AccountSecurityHealthResult.fromJson(json))
              .toList(),
    );
    final result = await client.query(options);
    thenGraphQLResultException(result);

    state = result.parsedData!;
  }

  static AccountSecurityHealthResult Function(List<AccountSecurityHealthResult>)
      selector(UserSecurityFields field) {
    return (List<AccountSecurityHealthResult> results) {
      return results.singleWhere(
        (AccountSecurityHealthResult element) => element.field == field,
        orElse: () => AccountSecurityHealthResult(field, status: false),
      );
    };
  }
}

final StateNotifierProvider<HealthNotofier, List<AccountSecurityHealthResult>>
    healthProvider =
    StateNotifierProvider<HealthNotofier, List<AccountSecurityHealthResult>>(
  (Ref ref) => HealthNotofier(ref),
);

final loadHealthResults = FutureProvider.autoDispose<void>((Ref ref) async {
  await ref.read(healthProvider.notifier).fetch();
});
