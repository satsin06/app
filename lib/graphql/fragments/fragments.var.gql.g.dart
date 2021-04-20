// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fragments.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GAuthorizationTokenFragmentVars>
    _$gAuthorizationTokenFragmentVarsSerializer =
    new _$GAuthorizationTokenFragmentVarsSerializer();

class _$GAuthorizationTokenFragmentVarsSerializer
    implements StructuredSerializer<GAuthorizationTokenFragmentVars> {
  @override
  final Iterable<Type> types = const [
    GAuthorizationTokenFragmentVars,
    _$GAuthorizationTokenFragmentVars
  ];
  @override
  final String wireName = 'GAuthorizationTokenFragmentVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GAuthorizationTokenFragmentVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GAuthorizationTokenFragmentVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GAuthorizationTokenFragmentVarsBuilder().build();
  }
}

class _$GAuthorizationTokenFragmentVars
    extends GAuthorizationTokenFragmentVars {
  factory _$GAuthorizationTokenFragmentVars(
          [void Function(GAuthorizationTokenFragmentVarsBuilder)? updates]) =>
      (new GAuthorizationTokenFragmentVarsBuilder()..update(updates)).build();

  _$GAuthorizationTokenFragmentVars._() : super._();

  @override
  GAuthorizationTokenFragmentVars rebuild(
          void Function(GAuthorizationTokenFragmentVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAuthorizationTokenFragmentVarsBuilder toBuilder() =>
      new GAuthorizationTokenFragmentVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAuthorizationTokenFragmentVars;
  }

  @override
  int get hashCode {
    return 754449009;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('GAuthorizationTokenFragmentVars')
        .toString();
  }
}

class GAuthorizationTokenFragmentVarsBuilder
    implements
        Builder<GAuthorizationTokenFragmentVars,
            GAuthorizationTokenFragmentVarsBuilder> {
  _$GAuthorizationTokenFragmentVars? _$v;

  GAuthorizationTokenFragmentVarsBuilder();

  @override
  void replace(GAuthorizationTokenFragmentVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAuthorizationTokenFragmentVars;
  }

  @override
  void update(void Function(GAuthorizationTokenFragmentVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GAuthorizationTokenFragmentVars build() {
    final _$result = _$v ?? new _$GAuthorizationTokenFragmentVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
