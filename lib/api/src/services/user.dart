import 'dart:io';

import '../api.dart';
import '../models/storage.dart';
import '../models/user.dart';

class UserService {
  final API api;
  const UserService(this.api);

  /// Query a user
  Future<User> findUnique(UserWhereUniqueInput where) async {
    const String query = r'''
      query UserFindUnique($where: UserWhereUniqueInput!) {
        user(where: $where) {
          id
          username
        }
      }
    ''';
    final Map<String, dynamic> data = await api.request(
      query: query,
      variables: {'where': where},
      operationName: 'UserFindUnique',
    );

    const String profileQuery = r'''
      query UserProfile($id: ID!) {
        userProfile(id: $id) {
          avatarStorageId
          bio
          birthday
          gender
        }
      }
    ''';
    final profile = await api.request(
      query: profileQuery,
      variables: {'id': data['user']['id']},
      operationName: 'UserProfile',
    );

    return User.fromJson(
      (data['user'] as Map<String, dynamic>)..addAll(profile['userProfile']),
    );
  }

  /// Update user
  Future<User> update({
    String? bio,
    int? birthday,
    UserGender? gender,
  }) async {
    const String query = r'''
      mutation UpdateUser ($data: UserProfileUncheckedUpdateInput!) {
        updateUserProfile(data: $data) {
          userId
        }
      }
    ''';
    final Map<String, dynamic> variables = {
      'data': {
        'bio': bio,
        'birthday': birthday,
        'gender': $UserGenderEnumMap[gender],
      },
    };
    final Map<String, dynamic> data = await api.request(
        query: query, variables: variables, operationName: 'UpdateUser');

    return findUnique(
      UserWhereUniqueInput.id(data['updateUserProfile']['userId']),
    );
  }

  /// Update avatar
  Future<User> updateAvatar(File file) async {
    final Storage storage = await api.storage.upload(file);

    const String query = r'''
      mutation UpdateUserAvatar($storageId: String!) {
        updateUserAvatar(storageId: $storageId) {
          userId
        }
      }
    ''';
    final Map<String, dynamic> data = await api.request(
        query: query,
        variables: {'storageId': storage.id},
        operationName: 'UpdateUserAvatar');

    return findUnique(
      UserWhereUniqueInput.id(data['updateUserAvatar']['userId']),
    );
  }

  /// Update username
  Future<User> updateUsername(String username) async {
    const String query = r'''
      mutation UpdateUsername($username: String!) {
        updateUsername(username: $username) {
          id
        }
      }
    ''';
    final Map<String, dynamic> data = await api.request(
        query: query,
        variables: {'username': username},
        operationName: 'UpdateUsername');

    return findUnique(
      UserWhereUniqueInput.id(data['updateUsername']['id']),
    );
  }
}
