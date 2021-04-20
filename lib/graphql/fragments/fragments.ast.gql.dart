// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:gql/ast.dart' as _i1;

const AuthorizationTokenFragment = _i1.FragmentDefinitionNode(
    name: _i1.NameNode(value: 'AuthorizationTokenFragment'),
    typeCondition: _i1.TypeConditionNode(
        on: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'AuthorizationTokenEntity'),
            isNonNull: false)),
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'expiredAt'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      _i1.FieldNode(
          name: _i1.NameNode(value: 'refreshExpiredAt'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      _i1.FieldNode(
          name: _i1.NameNode(value: 'token'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      _i1.FieldNode(
          name: _i1.NameNode(value: 'userId'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null)
    ]));
const document = _i1.DocumentNode(definitions: [AuthorizationTokenFragment]);
