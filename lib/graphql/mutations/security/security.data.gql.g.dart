// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'security.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GcreatePhoneSecurityData> _$gcreatePhoneSecurityDataSerializer =
    new _$GcreatePhoneSecurityDataSerializer();
Serializer<GcreatePhoneSecurityOfViewerData>
    _$gcreatePhoneSecurityOfViewerDataSerializer =
    new _$GcreatePhoneSecurityOfViewerDataSerializer();

class _$GcreatePhoneSecurityDataSerializer
    implements StructuredSerializer<GcreatePhoneSecurityData> {
  @override
  final Iterable<Type> types = const [
    GcreatePhoneSecurityData,
    _$GcreatePhoneSecurityData
  ];
  @override
  final String wireName = 'GcreatePhoneSecurityData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GcreatePhoneSecurityData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'createSecurity',
      serializers.serialize(object.createSecurity,
          specifiedType: const FullType(_i1.GDateTime)),
    ];

    return result;
  }

  @override
  GcreatePhoneSecurityData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GcreatePhoneSecurityDataBuilder();

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
        case 'createSecurity':
          result.createSecurity.replace(serializers.deserialize(value,
              specifiedType: const FullType(_i1.GDateTime))! as _i1.GDateTime);
          break;
      }
    }

    return result.build();
  }
}

class _$GcreatePhoneSecurityOfViewerDataSerializer
    implements StructuredSerializer<GcreatePhoneSecurityOfViewerData> {
  @override
  final Iterable<Type> types = const [
    GcreatePhoneSecurityOfViewerData,
    _$GcreatePhoneSecurityOfViewerData
  ];
  @override
  final String wireName = 'GcreatePhoneSecurityOfViewerData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GcreatePhoneSecurityOfViewerData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'createViewerSecurity',
      serializers.serialize(object.createViewerSecurity,
          specifiedType: const FullType(_i1.GDateTime)),
    ];

    return result;
  }

  @override
  GcreatePhoneSecurityOfViewerData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GcreatePhoneSecurityOfViewerDataBuilder();

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
        case 'createViewerSecurity':
          result.createViewerSecurity.replace(serializers.deserialize(value,
              specifiedType: const FullType(_i1.GDateTime))! as _i1.GDateTime);
          break;
      }
    }

    return result.build();
  }
}

class _$GcreatePhoneSecurityData extends GcreatePhoneSecurityData {
  @override
  final String G__typename;
  @override
  final _i1.GDateTime createSecurity;

  factory _$GcreatePhoneSecurityData(
          [void Function(GcreatePhoneSecurityDataBuilder)? updates]) =>
      (new GcreatePhoneSecurityDataBuilder()..update(updates)).build();

  _$GcreatePhoneSecurityData._(
      {required this.G__typename, required this.createSecurity})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GcreatePhoneSecurityData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        createSecurity, 'GcreatePhoneSecurityData', 'createSecurity');
  }

  @override
  GcreatePhoneSecurityData rebuild(
          void Function(GcreatePhoneSecurityDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GcreatePhoneSecurityDataBuilder toBuilder() =>
      new GcreatePhoneSecurityDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GcreatePhoneSecurityData &&
        G__typename == other.G__typename &&
        createSecurity == other.createSecurity;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), createSecurity.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GcreatePhoneSecurityData')
          ..add('G__typename', G__typename)
          ..add('createSecurity', createSecurity))
        .toString();
  }
}

class GcreatePhoneSecurityDataBuilder
    implements
        Builder<GcreatePhoneSecurityData, GcreatePhoneSecurityDataBuilder> {
  _$GcreatePhoneSecurityData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  _i1.GDateTimeBuilder? _createSecurity;
  _i1.GDateTimeBuilder get createSecurity =>
      _$this._createSecurity ??= new _i1.GDateTimeBuilder();
  set createSecurity(_i1.GDateTimeBuilder? createSecurity) =>
      _$this._createSecurity = createSecurity;

  GcreatePhoneSecurityDataBuilder() {
    GcreatePhoneSecurityData._initializeBuilder(this);
  }

  GcreatePhoneSecurityDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _createSecurity = $v.createSecurity.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GcreatePhoneSecurityData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GcreatePhoneSecurityData;
  }

  @override
  void update(void Function(GcreatePhoneSecurityDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GcreatePhoneSecurityData build() {
    _$GcreatePhoneSecurityData _$result;
    try {
      _$result = _$v ??
          new _$GcreatePhoneSecurityData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GcreatePhoneSecurityData', 'G__typename'),
              createSecurity: createSecurity.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'createSecurity';
        createSecurity.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GcreatePhoneSecurityData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GcreatePhoneSecurityOfViewerData
    extends GcreatePhoneSecurityOfViewerData {
  @override
  final String G__typename;
  @override
  final _i1.GDateTime createViewerSecurity;

  factory _$GcreatePhoneSecurityOfViewerData(
          [void Function(GcreatePhoneSecurityOfViewerDataBuilder)? updates]) =>
      (new GcreatePhoneSecurityOfViewerDataBuilder()..update(updates)).build();

  _$GcreatePhoneSecurityOfViewerData._(
      {required this.G__typename, required this.createViewerSecurity})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GcreatePhoneSecurityOfViewerData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(createViewerSecurity,
        'GcreatePhoneSecurityOfViewerData', 'createViewerSecurity');
  }

  @override
  GcreatePhoneSecurityOfViewerData rebuild(
          void Function(GcreatePhoneSecurityOfViewerDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GcreatePhoneSecurityOfViewerDataBuilder toBuilder() =>
      new GcreatePhoneSecurityOfViewerDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GcreatePhoneSecurityOfViewerData &&
        G__typename == other.G__typename &&
        createViewerSecurity == other.createViewerSecurity;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc(0, G__typename.hashCode), createViewerSecurity.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GcreatePhoneSecurityOfViewerData')
          ..add('G__typename', G__typename)
          ..add('createViewerSecurity', createViewerSecurity))
        .toString();
  }
}

class GcreatePhoneSecurityOfViewerDataBuilder
    implements
        Builder<GcreatePhoneSecurityOfViewerData,
            GcreatePhoneSecurityOfViewerDataBuilder> {
  _$GcreatePhoneSecurityOfViewerData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  _i1.GDateTimeBuilder? _createViewerSecurity;
  _i1.GDateTimeBuilder get createViewerSecurity =>
      _$this._createViewerSecurity ??= new _i1.GDateTimeBuilder();
  set createViewerSecurity(_i1.GDateTimeBuilder? createViewerSecurity) =>
      _$this._createViewerSecurity = createViewerSecurity;

  GcreatePhoneSecurityOfViewerDataBuilder() {
    GcreatePhoneSecurityOfViewerData._initializeBuilder(this);
  }

  GcreatePhoneSecurityOfViewerDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _createViewerSecurity = $v.createViewerSecurity.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GcreatePhoneSecurityOfViewerData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GcreatePhoneSecurityOfViewerData;
  }

  @override
  void update(void Function(GcreatePhoneSecurityOfViewerDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GcreatePhoneSecurityOfViewerData build() {
    _$GcreatePhoneSecurityOfViewerData _$result;
    try {
      _$result = _$v ??
          new _$GcreatePhoneSecurityOfViewerData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  'GcreatePhoneSecurityOfViewerData', 'G__typename'),
              createViewerSecurity: createViewerSecurity.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'createViewerSecurity';
        createViewerSecurity.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GcreatePhoneSecurityOfViewerData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
