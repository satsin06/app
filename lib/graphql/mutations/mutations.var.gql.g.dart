// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mutations.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreatePhoneSecurityVars> _$gCreatePhoneSecurityVarsSerializer =
    new _$GCreatePhoneSecurityVarsSerializer();
Serializer<GCreatePhoneSecurityOfViewerVars>
    _$gCreatePhoneSecurityOfViewerVarsSerializer =
    new _$GCreatePhoneSecurityOfViewerVarsSerializer();
Serializer<GCreateAuthorizationTokenVars>
    _$gCreateAuthorizationTokenVarsSerializer =
    new _$GCreateAuthorizationTokenVarsSerializer();

class _$GCreatePhoneSecurityVarsSerializer
    implements StructuredSerializer<GCreatePhoneSecurityVars> {
  @override
  final Iterable<Type> types = const [
    GCreatePhoneSecurityVars,
    _$GCreatePhoneSecurityVars
  ];
  @override
  final String wireName = 'GCreatePhoneSecurityVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreatePhoneSecurityVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'phone',
      serializers.serialize(object.phone,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GCreatePhoneSecurityVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreatePhoneSecurityVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GCreatePhoneSecurityOfViewerVarsSerializer
    implements StructuredSerializer<GCreatePhoneSecurityOfViewerVars> {
  @override
  final Iterable<Type> types = const [
    GCreatePhoneSecurityOfViewerVars,
    _$GCreatePhoneSecurityOfViewerVars
  ];
  @override
  final String wireName = 'GCreatePhoneSecurityOfViewerVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreatePhoneSecurityOfViewerVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GCreatePhoneSecurityOfViewerVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GCreatePhoneSecurityOfViewerVarsBuilder().build();
  }
}

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
          specifiedType: const FullType(_i2.GUserWhereUniqueInput)),
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(_i2.GUserSecurityCompareType)),
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
                  specifiedType: const FullType(_i2.GUserWhereUniqueInput))!
              as _i2.GUserWhereUniqueInput);
          break;
        case 'type':
          result.type = serializers.deserialize(value,
                  specifiedType: const FullType(_i2.GUserSecurityCompareType))
              as _i2.GUserSecurityCompareType;
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

class _$GCreatePhoneSecurityVars extends GCreatePhoneSecurityVars {
  @override
  final String phone;

  factory _$GCreatePhoneSecurityVars(
          [void Function(GCreatePhoneSecurityVarsBuilder)? updates]) =>
      (new GCreatePhoneSecurityVarsBuilder()..update(updates)).build();

  _$GCreatePhoneSecurityVars._({required this.phone}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        phone, 'GCreatePhoneSecurityVars', 'phone');
  }

  @override
  GCreatePhoneSecurityVars rebuild(
          void Function(GCreatePhoneSecurityVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreatePhoneSecurityVarsBuilder toBuilder() =>
      new GCreatePhoneSecurityVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreatePhoneSecurityVars && phone == other.phone;
  }

  @override
  int get hashCode {
    return $jf($jc(0, phone.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GCreatePhoneSecurityVars')
          ..add('phone', phone))
        .toString();
  }
}

class GCreatePhoneSecurityVarsBuilder
    implements
        Builder<GCreatePhoneSecurityVars, GCreatePhoneSecurityVarsBuilder> {
  _$GCreatePhoneSecurityVars? _$v;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  GCreatePhoneSecurityVarsBuilder();

  GCreatePhoneSecurityVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _phone = $v.phone;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreatePhoneSecurityVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreatePhoneSecurityVars;
  }

  @override
  void update(void Function(GCreatePhoneSecurityVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GCreatePhoneSecurityVars build() {
    final _$result = _$v ??
        new _$GCreatePhoneSecurityVars._(
            phone: BuiltValueNullFieldError.checkNotNull(
                phone, 'GCreatePhoneSecurityVars', 'phone'));
    replace(_$result);
    return _$result;
  }
}

class _$GCreatePhoneSecurityOfViewerVars
    extends GCreatePhoneSecurityOfViewerVars {
  factory _$GCreatePhoneSecurityOfViewerVars(
          [void Function(GCreatePhoneSecurityOfViewerVarsBuilder)? updates]) =>
      (new GCreatePhoneSecurityOfViewerVarsBuilder()..update(updates)).build();

  _$GCreatePhoneSecurityOfViewerVars._() : super._();

  @override
  GCreatePhoneSecurityOfViewerVars rebuild(
          void Function(GCreatePhoneSecurityOfViewerVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreatePhoneSecurityOfViewerVarsBuilder toBuilder() =>
      new GCreatePhoneSecurityOfViewerVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreatePhoneSecurityOfViewerVars;
  }

  @override
  int get hashCode {
    return 30313225;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('GCreatePhoneSecurityOfViewerVars')
        .toString();
  }
}

class GCreatePhoneSecurityOfViewerVarsBuilder
    implements
        Builder<GCreatePhoneSecurityOfViewerVars,
            GCreatePhoneSecurityOfViewerVarsBuilder> {
  _$GCreatePhoneSecurityOfViewerVars? _$v;

  GCreatePhoneSecurityOfViewerVarsBuilder();

  @override
  void replace(GCreatePhoneSecurityOfViewerVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreatePhoneSecurityOfViewerVars;
  }

  @override
  void update(void Function(GCreatePhoneSecurityOfViewerVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GCreatePhoneSecurityOfViewerVars build() {
    final _$result = _$v ?? new _$GCreatePhoneSecurityOfViewerVars._();
    replace(_$result);
    return _$result;
  }
}

class _$GCreateAuthorizationTokenVars extends GCreateAuthorizationTokenVars {
  @override
  final _i2.GUserWhereUniqueInput user;
  @override
  final _i2.GUserSecurityCompareType type;
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

  _i2.GUserWhereUniqueInputBuilder? _user;
  _i2.GUserWhereUniqueInputBuilder get user =>
      _$this._user ??= new _i2.GUserWhereUniqueInputBuilder();
  set user(_i2.GUserWhereUniqueInputBuilder? user) => _$this._user = user;

  _i2.GUserSecurityCompareType? _type;
  _i2.GUserSecurityCompareType? get type => _$this._type;
  set type(_i2.GUserSecurityCompareType? type) => _$this._type = type;

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
