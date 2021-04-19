// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'security.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GcreatePhoneSecurityVars> _$gcreatePhoneSecurityVarsSerializer =
    new _$GcreatePhoneSecurityVarsSerializer();
Serializer<GcreatePhoneSecurityOfViewerVars>
    _$gcreatePhoneSecurityOfViewerVarsSerializer =
    new _$GcreatePhoneSecurityOfViewerVarsSerializer();

class _$GcreatePhoneSecurityVarsSerializer
    implements StructuredSerializer<GcreatePhoneSecurityVars> {
  @override
  final Iterable<Type> types = const [
    GcreatePhoneSecurityVars,
    _$GcreatePhoneSecurityVars
  ];
  @override
  final String wireName = 'GcreatePhoneSecurityVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GcreatePhoneSecurityVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'phone',
      serializers.serialize(object.phone,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GcreatePhoneSecurityVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GcreatePhoneSecurityVarsBuilder();

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

class _$GcreatePhoneSecurityOfViewerVarsSerializer
    implements StructuredSerializer<GcreatePhoneSecurityOfViewerVars> {
  @override
  final Iterable<Type> types = const [
    GcreatePhoneSecurityOfViewerVars,
    _$GcreatePhoneSecurityOfViewerVars
  ];
  @override
  final String wireName = 'GcreatePhoneSecurityOfViewerVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GcreatePhoneSecurityOfViewerVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GcreatePhoneSecurityOfViewerVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GcreatePhoneSecurityOfViewerVarsBuilder().build();
  }
}

class _$GcreatePhoneSecurityVars extends GcreatePhoneSecurityVars {
  @override
  final String phone;

  factory _$GcreatePhoneSecurityVars(
          [void Function(GcreatePhoneSecurityVarsBuilder)? updates]) =>
      (new GcreatePhoneSecurityVarsBuilder()..update(updates)).build();

  _$GcreatePhoneSecurityVars._({required this.phone}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        phone, 'GcreatePhoneSecurityVars', 'phone');
  }

  @override
  GcreatePhoneSecurityVars rebuild(
          void Function(GcreatePhoneSecurityVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GcreatePhoneSecurityVarsBuilder toBuilder() =>
      new GcreatePhoneSecurityVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GcreatePhoneSecurityVars && phone == other.phone;
  }

  @override
  int get hashCode {
    return $jf($jc(0, phone.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GcreatePhoneSecurityVars')
          ..add('phone', phone))
        .toString();
  }
}

class GcreatePhoneSecurityVarsBuilder
    implements
        Builder<GcreatePhoneSecurityVars, GcreatePhoneSecurityVarsBuilder> {
  _$GcreatePhoneSecurityVars? _$v;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  GcreatePhoneSecurityVarsBuilder();

  GcreatePhoneSecurityVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _phone = $v.phone;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GcreatePhoneSecurityVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GcreatePhoneSecurityVars;
  }

  @override
  void update(void Function(GcreatePhoneSecurityVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GcreatePhoneSecurityVars build() {
    final _$result = _$v ??
        new _$GcreatePhoneSecurityVars._(
            phone: BuiltValueNullFieldError.checkNotNull(
                phone, 'GcreatePhoneSecurityVars', 'phone'));
    replace(_$result);
    return _$result;
  }
}

class _$GcreatePhoneSecurityOfViewerVars
    extends GcreatePhoneSecurityOfViewerVars {
  factory _$GcreatePhoneSecurityOfViewerVars(
          [void Function(GcreatePhoneSecurityOfViewerVarsBuilder)? updates]) =>
      (new GcreatePhoneSecurityOfViewerVarsBuilder()..update(updates)).build();

  _$GcreatePhoneSecurityOfViewerVars._() : super._();

  @override
  GcreatePhoneSecurityOfViewerVars rebuild(
          void Function(GcreatePhoneSecurityOfViewerVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GcreatePhoneSecurityOfViewerVarsBuilder toBuilder() =>
      new GcreatePhoneSecurityOfViewerVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GcreatePhoneSecurityOfViewerVars;
  }

  @override
  int get hashCode {
    return 840624553;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('GcreatePhoneSecurityOfViewerVars')
        .toString();
  }
}

class GcreatePhoneSecurityOfViewerVarsBuilder
    implements
        Builder<GcreatePhoneSecurityOfViewerVars,
            GcreatePhoneSecurityOfViewerVarsBuilder> {
  _$GcreatePhoneSecurityOfViewerVars? _$v;

  GcreatePhoneSecurityOfViewerVarsBuilder();

  @override
  void replace(GcreatePhoneSecurityOfViewerVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GcreatePhoneSecurityOfViewerVars;
  }

  @override
  void update(void Function(GcreatePhoneSecurityOfViewerVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GcreatePhoneSecurityOfViewerVars build() {
    final _$result = _$v ?? new _$GcreatePhoneSecurityOfViewerVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
