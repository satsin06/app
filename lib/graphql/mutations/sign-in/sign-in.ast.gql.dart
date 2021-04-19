// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:gql/ast.dart' as _i1;

const CreateAuthorizationToken = _i1.OperationDefinitionNode(
    type: _i1.OperationType.mutation,
    name: _i1.NameNode(value: 'CreateAuthorizationToken'),
    variableDefinitions: [
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'user')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'UserWhereUniqueInput'),
              isNonNull: true),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: []),
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'type')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'UserSecurityCompareType'),
              isNonNull: true),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: []),
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'security')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: true),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: [])
    ],
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'createAuthorizationToken'),
          alias: null,
          arguments: [
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'user'),
                value: _i1.VariableNode(name: _i1.NameNode(value: 'user'))),
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'type'),
                value: _i1.VariableNode(name: _i1.NameNode(value: 'type'))),
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'security'),
                value: _i1.VariableNode(name: _i1.NameNode(value: 'security')))
          ],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
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
          ]))
    ]));
const document = _i1.DocumentNode(definitions: [CreateAuthorizationToken]);
