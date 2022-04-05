import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';

import '../models/user.dart';
import 'graphql_provider.dart';

final _queryUserDocumentNode = gql(r'''
query User($where: UserWhereUniqueInput!) {
  user(where: $where) {
    email
    id
    phone
    username
    profile {
      avatar
      bio
      birthday
      gender
    }
  }
}
''');

QueryOptions<User> _createQueryUserOptions(String id) {
  return QueryOptions(
    document: _queryUserDocumentNode,
    fetchPolicy: FetchPolicy.noCache,
    variables: <String, dynamic>{
      'where': <String, dynamic>{
        'id': id,
      },
    },
    parserFn: (data) => userParser(data['user']),
  );
}

User userParser(Map<String, dynamic> data) {
  return User()
    ..id = data['id'] as String
    ..email = data['email'] as String?
    ..phone = data['phone'] as String?
    ..username = data['username'] as String?
    ..profile = UserProfile()
    ..profile?.avatar = data['profile']['avatar'] as String?
    ..profile?.bio = data['profile']['bio'] as String?
    ..profile?.birthday = data['profile']['birthday'] as int?
    ..profile?.id = data['id'] as String;
}

class UserNotifier extends StateNotifier<User> {
  UserNotifier(this.ref, String userId) : super(User()..id = userId);

  final Ref ref;

  void update(User update) {
    state = User()
      ..id = state.id
      ..email = update.email ?? state.email
      ..phone = update.phone ?? state.phone
      ..username = update.username ?? state.username
      ..profile ??= (UserProfile()..id = state.id)
      ..profile?.avatar = update.profile?.avatar ?? state.profile?.avatar
      ..profile?.bio = update.profile?.bio ?? state.profile?.bio
      ..profile?.birthday = update.profile?.birthday ?? state.profile?.birthday;
  }
}

final userProvider = StateNotifierProvider.family<UserNotifier, User, String>(
  (Ref ref, String userId) => UserNotifier(ref, userId),
);

final refreshUserProvider = FutureProvider.autoDispose.family<User, String>(
  (Ref ref, String userId) async {
    final client = ref.read(graphqlClientProvider);
    final options = _createQueryUserOptions(userId);

    final result = await client.query(options);

    if (result.hasException) {
      if (result.exception!.graphqlErrors.isNotEmpty) {
        throw FormatException(result.exception!.graphqlErrors.first.message);
      }

      throw result.exception!;
    }

    final provider = userProvider(userId);
    ref.read(provider.notifier).update(result.parsedData!);

    return result.parsedData!;
  },
);
