// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fragments.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GAuthorizationTokenFragmentData>
    _$gAuthorizationTokenFragmentDataSerializer =
    new _$GAuthorizationTokenFragmentDataSerializer();

class _$GAuthorizationTokenFragmentDataSerializer
    implements StructuredSerializer<GAuthorizationTokenFragmentData> {
  @override
  final Iterable<Type> types = const [
    GAuthorizationTokenFragmentData,
    _$GAuthorizationTokenFragmentData
  ];
  @override
  final String wireName = 'GAuthorizationTokenFragmentData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GAuthorizationTokenFragmentData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'expiredAt',
      serializers.serialize(object.expiredAt,
          specifiedType: const FullType(DateTime)),
      'refreshExpiredAt',
      serializers.serialize(object.refreshExpiredAt,
          specifiedType: const FullType(DateTime)),
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
  GAuthorizationTokenFragmentData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAuthorizationTokenFragmentDataBuilder();

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
        case 'expiredAt':
          result.expiredAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'refreshExpiredAt':
          result.refreshExpiredAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
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

class _$GAuthorizationTokenFragmentData
    extends GAuthorizationTokenFragmentData {
  @override
  final String G__typename;
  @override
  final DateTime expiredAt;
  @override
  final DateTime refreshExpiredAt;
  @override
  final String token;
  @override
  final String userId;

  factory _$GAuthorizationTokenFragmentData(
          [void Function(GAuthorizationTokenFragmentDataBuilder)? updates]) =>
      (new GAuthorizationTokenFragmentDataBuilder()..update(updates)).build();

  _$GAuthorizationTokenFragmentData._(
      {required this.G__typename,
      required this.expiredAt,
      required this.refreshExpiredAt,
      required this.token,
      required this.userId})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GAuthorizationTokenFragmentData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        expiredAt, 'GAuthorizationTokenFragmentData', 'expiredAt');
    BuiltValueNullFieldError.checkNotNull(refreshExpiredAt,
        'GAuthorizationTokenFragmentData', 'refreshExpiredAt');
    BuiltValueNullFieldError.checkNotNull(
        token, 'GAuthorizationTokenFragmentData', 'token');
    BuiltValueNullFieldError.checkNotNull(
        userId, 'GAuthorizationTokenFragmentData', 'userId');
  }

  @override
  GAuthorizationTokenFragmentData rebuild(
          void Function(GAuthorizationTokenFragmentDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAuthorizationTokenFragmentDataBuilder toBuilder() =>
      new GAuthorizationTokenFragmentDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAuthorizationTokenFragmentData &&
        G__typename == other.G__typename &&
        expiredAt == other.expiredAt &&
        refreshExpiredAt == other.refreshExpiredAt &&
        token == other.token &&
        userId == other.userId;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, G__typename.hashCode), expiredAt.hashCode),
                refreshExpiredAt.hashCode),
            token.hashCode),
        userId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GAuthorizationTokenFragmentData')
          ..add('G__typename', G__typename)
          ..add('expiredAt', expiredAt)
          ..add('refreshExpiredAt', refreshExpiredAt)
          ..add('token', token)
          ..add('userId', userId))
        .toString();
  }
}

class GAuthorizationTokenFragmentDataBuilder
    implements
        Builder<GAuthorizationTokenFragmentData,
            GAuthorizationTokenFragmentDataBuilder> {
  _$GAuthorizationTokenFragmentData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  DateTime? _expiredAt;
  DateTime? get expiredAt => _$this._expiredAt;
  set expiredAt(DateTime? expiredAt) => _$this._expiredAt = expiredAt;

  DateTime? _refreshExpiredAt;
  DateTime? get refreshExpiredAt => _$this._refreshExpiredAt;
  set refreshExpiredAt(DateTime? refreshExpiredAt) =>
      _$this._refreshExpiredAt = refreshExpiredAt;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  GAuthorizationTokenFragmentDataBuilder() {
    GAuthorizationTokenFragmentData._initializeBuilder(this);
  }

  GAuthorizationTokenFragmentDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _expiredAt = $v.expiredAt;
      _refreshExpiredAt = $v.refreshExpiredAt;
      _token = $v.token;
      _userId = $v.userId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAuthorizationTokenFragmentData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAuthorizationTokenFragmentData;
  }

  @override
  void update(void Function(GAuthorizationTokenFragmentDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GAuthorizationTokenFragmentData build() {
    final _$result = _$v ??
        new _$GAuthorizationTokenFragmentData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, 'GAuthorizationTokenFragmentData', 'G__typename'),
            expiredAt: BuiltValueNullFieldError.checkNotNull(
                expiredAt, 'GAuthorizationTokenFragmentData', 'expiredAt'),
            refreshExpiredAt: BuiltValueNullFieldError.checkNotNull(
                refreshExpiredAt,
                'GAuthorizationTokenFragmentData',
                'refreshExpiredAt'),
            token: BuiltValueNullFieldError.checkNotNull(
                token, 'GAuthorizationTokenFragmentData', 'token'),
            userId: BuiltValueNullFieldError.checkNotNull(
                userId, 'GAuthorizationTokenFragmentData', 'userId'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
