import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';

import '../../../../models/user_profile.dart';
import '../../../../providers/auth.dart';
import '../../../../providers/graphql.dart';
import '../../../../providers/user.dart';

const _document = r'''
mutation UpdateUserProfile($data: UserProfileUncheckedUpdateInput!) {
  updateUserProfile(data: $data) {
    gender
    birthday
    bio
    avatarStorageId
    userId
  }
}
''';

MutationOptions<UserProfile> _createOptions(
    {String? bio, int? birthday, UserGender? gender}) {
  // Validate birthday
  if (birthday != null && birthday.toString().length != 8) {
    throw const FormatException('birthday is illegal');
  }

  return MutationOptions<UserProfile>(
    document: gql(_document),
    fetchPolicy: FetchPolicy.noCache,
    variables: <String, dynamic>{
      'data': <String, dynamic>{
        'bio': bio,
        'birthday': birthday,
        'gender': gender == null ? null : UserGenderEnumMap[gender],
      }
    },
    operationName: 'UpdateUserProfile',
    parserFn: (Map<String, dynamic> data) =>
        UserProfile.fromJson(data['updateUserProfile']),
  );
}

Future<UserProfile> Function({String? bio, int? birthday, UserGender? gender})
    updateAuthProfile(WidgetRef ref) =>
        ({String? bio, int? birthday, UserGender? gender}) async {
          final GraphQLClient client = ref.read(graphqlClientProvider);
          final MutationOptions<UserProfile> options = _createOptions(
            bio: bio,
            birthday: birthday,
            gender: gender,
          );
          final QueryResult<UserProfile> result = await client.mutate(options);
          thenGraphQLResultException(result);

          final String? auth = ref.read(authProvider);
          final StateController<UserProfile> notifier =
              ref.read(userProfileProvider(auth!).notifier);

          return notifier.state = result.parsedData!;
        };
