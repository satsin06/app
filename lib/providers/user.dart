import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';

import '../models/user.dart';
import '../models/user_profile.dart';
import 'graphql.dart';

final _queryUserDocumentNode = gql(r'''
query User($where: UserWhereUniqueInput!) {
  user(where: $where) {
    id
    username,
    profile {
      userId
      avatarStorageId
      bio
      birthday
      gender
    }
  }
}
''');

QueryOptions<Map<String, dynamic>> _createQueryUserOptions(String id) {
  return QueryOptions(
    document: _queryUserDocumentNode,
    fetchPolicy: FetchPolicy.noCache,
    variables: <String, dynamic>{
      'where': <String, dynamic>{
        'id': id,
      },
    },
    parserFn: (data) => data['user'],
  );
}

final StateProviderFamily<User, String> userProvider =
    StateProvider.family<User, String>(
  (Ref ref, String userId) => User(id: userId),
);

final StateProviderFamily<UserProfile, String> userProfileProvider =
    StateProvider.family<UserProfile, String>(
  (Ref ref, String userId) => UserProfile(userId: userId),
);

final AutoDisposeFutureProviderFamily<void, String> loadUserProvider =
    FutureProvider.autoDispose.family<void, String>(
  (Ref ref, String userId) async {
    final client = ref.read(graphqlClientProvider);
    final options = _createQueryUserOptions(userId);

    final result = await client.query(options);
    thenGraphQLResultException(result);

    final data = result.parsedData!;

    ref.read(userProvider(userId).state).state = User.fromJson(data);
    ref.read(userProfileProvider(userId).state).state =
        UserProfile.fromJson(data['profile']);
  },
);
