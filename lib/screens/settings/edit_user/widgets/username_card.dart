import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';

import '../../../../models/user.dart';
import '../../../../providers/auth.dart';
import '../../../../providers/graphql.dart';
import '../../../../providers/user.dart';
import '../../../../widgets/card_wrapper.dart';
import 'label_row_wrapper.dart';

class UsernameCard extends ConsumerWidget {
  const UsernameCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String userId = ref.read(authProvider)!;
    final privider = userProvider(userId);
    final String? username = ref.watch(privider).username;

    Widget? child;
    if (username == null) {
      child = const Text('设置用户名');
    }

    return CardWrapper(
      child: ListTile(
        title: LabelRowWrapper(
          labelText: '用户名',
          text: username,
          child: child,
        ),
        trailing: IconButton(
          onPressed: () => _showChangeUsernameDialog(context),
          icon: const Icon(Icons.edit),
        ),
      ),
    );
  }

  void _showChangeUsernameDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: _ChangeUsernameDialog.builder,
    );
  }
}

class _ChangeUsernameDialog extends ConsumerWidget {
  _ChangeUsernameDialog._({Key? key}) : super(key: key);

  factory _ChangeUsernameDialog.builder(BuildContext context) =>
      _ChangeUsernameDialog._();

  final AutoDisposeChangeNotifierProvider<TextEditingController>
      controllerProvider = ChangeNotifierProvider.autoDispose((Ref ref) {
    final String userId = ref.read(authProvider)!;
    final User user = ref.read(userProvider(userId));

    return TextEditingController(text: user.username);
  });

  final AutoDisposeStateProvider<String?> errorMessageProvider =
      StateProvider.autoDispose<String?>(((ref) => null));

  final AutoDisposeStateProvider<bool> sendingProvider =
      StateProvider.autoDispose<bool>(((ref) => false));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool sending = ref.watch(sendingProvider);
    final TextEditingController controller = ref.watch(controllerProvider);

    final Widget confirmChild = sending
        ? const SizedBox.square(
            child: CircularProgressIndicator(strokeWidth: 2),
            dimension: 20,
          )
        : const Text('确认');

    final VoidCallback? onCencel =
        sending ? null : () => Navigator.of(context).pop();
    VoidCallback? onConfirm;
    if (sending == false && controller.text.isNotEmpty) {
      onConfirm = () => onChangeUsername(context, ref);
    }

    return AlertDialog(
      content: TextField(
        autofocus: true,
        enabled: !sending,
        controller: controller,
        decoration: InputDecoration(
          hintText: '请输入用户名',
          label: const Text('用户名'),
          errorText: ref.watch(errorMessageProvider),
        ),
      ),
      actions: [
        TextButton(
          child: const Text('取消'),
          onPressed: onCencel,
        ),
        ElevatedButton(
          child: confirmChild,
          onPressed: onConfirm,
        ),
      ],
    );
  }

  void onChangeUsername(BuildContext context, WidgetRef ref) async {
    final String username = ref.read(controllerProvider).text.trim();
    if (username.isEmpty) {
      ref.read(errorMessageProvider.state).state = '用户名不能为空';
      return;
    }

    final String userId = ref.read(authProvider)!;
    final User user = ref.read(userProvider(userId));
    if (username == user.username) {
      return Navigator.of(context).pop();
    }

    final MutationOptions<String> options = MutationOptions<String>(
      document: gql(r'''
        mutation UpdateUsername($username: String!) {
          updateUsername(username: $username) {
            username
          }
        }
      '''),
      variables: <String, dynamic>{'username': username},
      operationName: 'UpdateUsername',
      fetchPolicy: FetchPolicy.noCache,
      parserFn: (Map<String, dynamic> data) =>
          data['updateUsername']['username'],
    );
    final GraphQLClient client = ref.read(graphqlClientProvider);

    try {
      /// Set sending state to true
      ref.read(sendingProvider.state).state = true;

      // Send mutation
      final QueryResult<String> result = await client.mutate(options);
      thenGraphQLResultException(result);

      /// Change username
      ref.read(userProvider(userId).state).state =
          user.copyWith(username: result.parsedData);

      /// Close dialog
      Navigator.of(context).pop();
    } catch (e) {
      ref.read(errorMessageProvider.state).state =
          e is FormatException ? e.message : e.toString();
      return;
    } finally {
      ref.read(sendingProvider.state).state = false;
    }
  }
}
