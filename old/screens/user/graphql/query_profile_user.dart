import 'package:graphql/client.dart';

import '../../../graphql/client.dart';
import '../../../hive/models/user.dart';
import '../../../hive/models/user_profile.dart';

const String _document = r'''
query ProfileUserData($id: ID!) {
  user(where: { id: $id }) {
    id
    username
    profile {
      avatar
      bio
      gender
      birthday
    }
  }
}
''';

QueryOptions _createQueryOptions(String id) {
  return QueryOptions(
    document: gql(_document),
    variables: <String, dynamic>{
      r'id': id,
    },
    fetchPolicy: FetchPolicy.noCache,
  );
}

Future<User> queryProfileUser(String id) async {
  final QueryOptions options = _createQueryOptions(id);
  final GraphQLClient client = await getGraphQLClient();

  final result = await client.query(options);
  if (result.hasException) {
    throw result.exception!.graphqlErrors.isNotEmpty
        ? result.exception!.graphqlErrors.first
        : result.exception!.linkException!;
  }

  final dynamic userDate = result.data!['user'];
  if (userDate == null) {
    return throw Exception('User not found');
  }

  final Map<String, dynamic> userMap = userDate as Map<String, dynamic>;
  final User user = User()
    ..id = userMap['id']
    ..username = userMap['username']
    ..profile = UserProfile()
    ..profile?.userId = userMap['id'] as String
    ..profile?.bio = userMap['profile']['bio']
    ..profile?.avatar = userMap['profile']['avatar'];

  return user;
}
