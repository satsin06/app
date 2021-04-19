// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign-in.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateAuthorizationTokenVars>
    _$gCreateAuthorizationTokenVarsSerializer =
    new _$GCreateAuthorizationTokenVarsSerializer();

class _$GCreateAuthorizationTokenVarsSerializer
    implements StructuredSerializer<GCreateAuthorizationTokenVars> {
  @override
  final Iterable<Type> types = const [
    GCreateAuthorizationTokenVars,
    _$GCreateAuthorizationTokenVars
  ];
  @override
  final String wireName = 'GCreateAuthorizationTokenVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateAuthorizationTokenVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'user',
      serializers.serialize(object.user,
          specifiedType: const FullType(_i1.GUserWhereUniqueInput)),
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(_i1.GUserSecurityCompareType)),
      'security',
      serializers.serialize(object.security,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GCreateAuthorizationTokenVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateAuthorizationTokenVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'user':
          result.user.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GUserWhereUniqueInput))!
              as _i1.GUserWhereUniqueInput);
          break;
        case 'type':
          result.type = serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GUserSecurityCompareType))
              as _i1.GUserSecurityCompareType;
          break;
        case 'security':
          result.security = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateAuthorizationTokenVars extends GCreateAuthorizationTokenVars {
  @override
  final _i1.GUserWhereUniqueInput user;
  @override
  final _i1.GUserSecurityCompareType type;
  @override
  final String security;

  factory _$GCreateAuthorizationTokenVars(
          [void Function(GCreateAuthorizationTokenVarsBuilder)? updates]) =>
      (new GCreateAuthorizationTokenVarsBuilder()..update(updates)).build();

  _$GCreateAuthorizationTokenVars._(
      {required this.user, required this.type, required this.security})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        user, 'GCreateAuthorizationTokenVars', 'user');
    BuiltValueNullFieldError.checkNotNull(
        type, 'GCreateAuthorizationTokenVars', 'type');
    BuiltValueNullFieldError.checkNotNull(
        security, 'GCreateAuthorizationTokenVars', 'security');
  }

  @override
  GCreateAuthorizationTokenVars rebuild(
          void Function(GCreateAuthorizationTokenVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateAuthorizationTokenVarsBuilder toBuilder() =>
      new GCreateAuthorizationTokenVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateAuthorizationTokenVars &&
        user == other.user &&
        type == other.type &&
        security == other.security;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, user.hashCode), type.hashCode), security.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GCreateAuthorizationTokenVars')
          ..add('user', user)
          ..add('type', type)
          ..add('security', security))
        .toString();
  }
}

class GCreateAuthorizationTokenVarsBuilder
    implements
        Builder<GCreateAuthorizationTokenVars,
            GCreateAuthorizationTokenVarsBuilder> {
  _$GCreateAuthorizationTokenVars? _$v;

  _i1.GUserWhereUniqueInputBuilder? _user;
  _i1.GUserWhereUniqueInputBuilder get user =>
      _$this._user ??= new _i1.GUserWhereUniqueInputBuilder();
  set user(_i1.GUserWhereUniqueInputBuilder? user) => _$this._user = user;

  _i1.GUserSecurityCompareType? _type;
  _i1.GUserSecurityCompareType? get type => _$this._type;
  set type(_i1.GUserSecurityCompareType? type) => _$this._type = type;

  String? _security;
  String? get security => _$this._security;
  set security(String? security) => _$this._security = security;

  GCreateAuthorizationTokenVarsBuilder();

  GCreateAuthorizationTokenVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user = $v.user.toBuilder();
      _type = $v.type;
      _security = $v.security;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateAuthorizationTokenVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateAuthorizationTokenVars;
  }

  @override
  void update(void Function(GCreateAuthorizationTokenVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GCreateAuthorizationTokenVars build() {
    _$GCreateAuthorizationTokenVars _$result;
    try {
      _$result = _$v ??
          new _$GCreateAuthorizationTokenVars._(
              user: user.build(),
              type: BuiltValueNullFieldError.checkNotNull(
                  type, 'GCreateAuthorizationTokenVars', 'type'),
              security: BuiltValueNullFieldError.checkNotNull(
                  security, 'GCreateAuthorizationTokenVars', 'security'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        user.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GCreateAuthorizationTokenVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
