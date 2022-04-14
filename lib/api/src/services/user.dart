import 'dart:io';

import '../api.dart';
import '../models/storage.dart';
import '../models/user.dart';

class UserService {
  final API api;
  const UserService(this.api);

  /// Query a user
  Future<User> findUnique(UserWhereUniqueInput where) async {
    final String query = r'''
      query UserFindUnique($where: UserWhereUniqueInput!) {
        user(where: $where) {
          ...UserFields
        }
      }
    ''' +
        _userFieldsFragment;
    final Map<String, dynamic> data = await api.request(
      query: query,
      variables: {'where': where},
      operationName: 'UserFindUnique',
    );
    final Map<String, dynamic> user = data['user'] as Map<String, dynamic>;
    user.addAll(user['profile']);

    return User.fromJson(user);
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
          avatarStorageId
          bio
          birthday
          gender
          user {
            username
            id
          }
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
    final Map<String, dynamic> user = data['updateUserProfile'];
    user.addAll(user['user']);

    return User.fromJson(user);
  }

  /// Update avatar
  Future<User> updateAvatar(File file) async {
    final Storage storage = await api.storage.upload(file);

    const String query = r'''
      mutation UpdateUserAvatar($storageId: String!) {
        updateUserAvatar(storageId: $storageId) {
          avatarStorageId
          bio
          birthday
          gender
          user {
            id
            username
          }
        }
      }
    ''';
    final Map<String, dynamic> data = await api.request(
        query: query,
        variables: {'storageId': storage.id},
        operationName: 'UpdateUserAvatar');
    final Map<String, dynamic> user = data['updateUserAvatar'];
    user.addAll(user['user']);

    return User.fromJson(user);
  }

  /// Update username
  Future<User> updateUsername(String username) async {
    const String query = r'''
      mutation UpdateUsername($username: String!) {
        updateUsername(username: $username) {
          id
          username
          profile {
            gender
            birthday
            bio
            avatarStorageId
          }
        }
      }
    ''';
    final Map<String, dynamic> data = await api.request(
        query: query,
        variables: {'username': username},
        operationName: 'UpdateUsername');
    final Map<String, dynamic> user =
        data['updateUsername'] as Map<String, dynamic>;
    user.addAll(user['profile']);

    return User.fromJson(user);
  }
}

extension _UserFieldsFragment on UserService {
  String get _userFieldsFragment => r'''
    fragment UserFields on User {
      id
      username
      profile {
        avatarStorageId
        bio
        birthday
        gender
      }
    }
    ''';
}
