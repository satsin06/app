// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign-in.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreateAuthorizationTokenData>
    _$gCreateAuthorizationTokenDataSerializer =
    new _$GCreateAuthorizationTokenDataSerializer();
Serializer<GCreateAuthorizationTokenData_createAuthorizationToken>
    _$gCreateAuthorizationTokenDataCreateAuthorizationTokenSerializer =
    new _$GCreateAuthorizationTokenData_createAuthorizationTokenSerializer();

class _$GCreateAuthorizationTokenDataSerializer
    implements StructuredSerializer<GCreateAuthorizationTokenData> {
  @override
  final Iterable<Type> types = const [
    GCreateAuthorizationTokenData,
    _$GCreateAuthorizationTokenData
  ];
  @override
  final String wireName = 'GCreateAuthorizationTokenData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateAuthorizationTokenData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'createAuthorizationToken',
      serializers.serialize(object.createAuthorizationToken,
          specifiedType: const FullType(
              GCreateAuthorizationTokenData_createAuthorizationToken)),
    ];

    return result;
  }

  @override
  GCreateAuthorizationTokenData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateAuthorizationTokenDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'createAuthorizationToken':
          result.createAuthorizationToken.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GCreateAuthorizationTokenData_createAuthorizationToken))!
              as GCreateAuthorizationTokenData_createAuthorizationToken);
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateAuthorizationTokenData_createAuthorizationTokenSerializer
    implements
        StructuredSerializer<
            GCreateAuthorizationTokenData_createAuthorizationToken> {
  @override
  final Iterable<Type> types = const [
    GCreateAuthorizationTokenData_createAuthorizationToken,
    _$GCreateAuthorizationTokenData_createAuthorizationToken
  ];
  @override
  final String wireName =
      'GCreateAuthorizationTokenData_createAuthorizationToken';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GCreateAuthorizationTokenData_createAuthorizationToken object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'token',
      serializers.serialize(object.token,
          specifiedType: const FullType(String)),
      'userId',
      serializers.serialize(object.userId,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GCreateAuthorizationTokenData_createAuthorizationToken deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GCreateAuthorizationTokenData_createAuthorizationTokenBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateAuthorizationTokenData extends GCreateAuthorizationTokenData {
  @override
  final String G__typename;
  @override
  final GCreateAuthorizationTokenData_createAuthorizationToken
      createAuthorizationToken;

  factory _$GCreateAuthorizationTokenData(
          [void Function(GCreateAuthorizationTokenDataBuilder)? updates]) =>
      (new GCreateAuthorizationTokenDataBuilder()..update(updates)).build();

  _$GCreateAuthorizationTokenData._(
      {required this.G__typename, required this.createAuthorizationToken})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GCreateAuthorizationTokenData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(createAuthorizationToken,
        'GCreateAuthorizationTokenData', 'createAuthorizationToken');
  }

  @override
  GCreateAuthorizationTokenData rebuild(
          void Function(GCreateAuthorizationTokenDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateAuthorizationTokenDataBuilder toBuilder() =>
      new GCreateAuthorizationTokenDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateAuthorizationTokenData &&
        G__typename == other.G__typename &&
        createAuthorizationToken == other.createAuthorizationToken;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc(0, G__typename.hashCode), createAuthorizationToken.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GCreateAuthorizationTokenData')
          ..add('G__typename', G__typename)
          ..add('createAuthorizationToken', createAuthorizationToken))
        .toString();
  }
}

class GCreateAuthorizationTokenDataBuilder
    implements
        Builder<GCreateAuthorizationTokenData,
            GCreateAuthorizationTokenDataBuilder> {
  _$GCreateAuthorizationTokenData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GCreateAuthorizationTokenData_createAuthorizationTokenBuilder?
      _createAuthorizationToken;
  GCreateAuthorizationTokenData_createAuthorizationTokenBuilder
      get createAuthorizationToken => _$this._createAuthorizationToken ??=
          new GCreateAuthorizationTokenData_createAuthorizationTokenBuilder();
  set createAuthorizationToken(
          GCreateAuthorizationTokenData_createAuthorizationTokenBuilder?
              createAuthorizationToken) =>
      _$this._createAuthorizationToken = createAuthorizationToken;

  GCreateAuthorizationTokenDataBuilder() {
    GCreateAuthorizationTokenData._initializeBuilder(this);
  }

  GCreateAuthorizationTokenDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _createAuthorizationToken = $v.createAuthorizationToken.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateAuthorizationTokenData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateAuthorizationTokenData;
  }

  @override
  void update(void Function(GCreateAuthorizationTokenDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GCreateAuthorizationTokenData build() {
    _$GCreateAuthorizationTokenData _$result;
    try {
      _$result = _$v ??
          new _$GCreateAuthorizationTokenData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GCreateAuthorizationTokenData', 'G__typename'),
              createAuthorizationToken: createAuthorizationToken.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'createAuthorizationToken';
        createAuthorizationToken.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GCreateAuthorizationTokenData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GCreateAuthorizationTokenData_createAuthorizationToken
    extends GCreateAuthorizationTokenData_createAuthorizationToken {
  @override
  final String G__typename;
  @override
  final String token;
  @override
  final String userId;

  factory _$GCreateAuthorizationTokenData_createAuthorizationToken(
          [void Function(
                  GCreateAuthorizationTokenData_createAuthorizationTokenBuilder)?
              updates]) =>
      (new GCreateAuthorizationTokenData_createAuthorizationTokenBuilder()
            ..update(updates))
          .build();

  _$GCreateAuthorizationTokenData_createAuthorizationToken._(
      {required this.G__typename, required this.token, required this.userId})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        'GCreateAuthorizationTokenData_createAuthorizationToken',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(token,
        'GCreateAuthorizationTokenData_createAuthorizationToken', 'token');
    BuiltValueNullFieldError.checkNotNull(userId,
        'GCreateAuthorizationTokenData_createAuthorizationToken', 'userId');
  }

  @override
  GCreateAuthorizationTokenData_createAuthorizationToken rebuild(
          void Function(
                  GCreateAuthorizationTokenData_createAuthorizationTokenBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateAuthorizationTokenData_createAuthorizationTokenBuilder toBuilder() =>
      new GCreateAuthorizationTokenData_createAuthorizationTokenBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateAuthorizationTokenData_createAuthorizationToken &&
        G__typename == other.G__typename &&
        token == other.token &&
        userId == other.userId;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, G__typename.hashCode), token.hashCode), userId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GCreateAuthorizationTokenData_createAuthorizationToken')
          ..add('G__typename', G__typename)
          ..add('token', token)
          ..add('userId', userId))
        .toString();
  }
}

class GCreateAuthorizationTokenData_createAuthorizationTokenBuilder
    implements
        Builder<GCreateAuthorizationTokenData_createAuthorizationToken,
            GCreateAuthorizationTokenData_createAuthorizationTokenBuilder> {
  _$GCreateAuthorizationTokenData_createAuthorizationToken? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  GCreateAuthorizationTokenData_createAuthorizationTokenBuilder() {
    GCreateAuthorizationTokenData_createAuthorizationToken._initializeBuilder(
        this);
  }

  GCreateAuthorizationTokenData_createAuthorizationTokenBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _token = $v.token;
      _userId = $v.userId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateAuthorizationTokenData_createAuthorizationToken other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateAuthorizationTokenData_createAuthorizationToken;
  }

  @override
  void update(
      void Function(
              GCreateAuthorizationTokenData_createAuthorizationTokenBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GCreateAuthorizationTokenData_createAuthorizationToken build() {
    final _$result = _$v ??
        new _$GCreateAuthorizationTokenData_createAuthorizationToken._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                'GCreateAuthorizationTokenData_createAuthorizationToken',
                'G__typename'),
            token: BuiltValueNullFieldError.checkNotNull(
                token,
                'GCreateAuthorizationTokenData_createAuthorizationToken',
                'token'),
            userId: BuiltValueNullFieldError.checkNotNull(
                userId,
                'GCreateAuthorizationTokenData_createAuthorizationToken',
                'userId'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
