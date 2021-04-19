// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'security.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GcreatePhoneSecurityReq> _$gcreatePhoneSecurityReqSerializer =
    new _$GcreatePhoneSecurityReqSerializer();
Serializer<GcreatePhoneSecurityOfViewerReq>
    _$gcreatePhoneSecurityOfViewerReqSerializer =
    new _$GcreatePhoneSecurityOfViewerReqSerializer();

class _$GcreatePhoneSecurityReqSerializer
    implements StructuredSerializer<GcreatePhoneSecurityReq> {
  @override
  final Iterable<Type> types = const [
    GcreatePhoneSecurityReq,
    _$GcreatePhoneSecurityReq
  ];
  @override
  final String wireName = 'GcreatePhoneSecurityReq';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GcreatePhoneSecurityReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GcreatePhoneSecurityVars)),
      'operation',
      serializers.serialize(object.operation,
          specifiedType: const FullType(_i4.Operation)),
      'executeOnListen',
      serializers.serialize(object.executeOnListen,
          specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.requestId;
    if (value != null) {
      result
        ..add('requestId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.optimisticResponse;
    if (value != null) {
      result
        ..add('optimisticResponse')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(_i2.GcreatePhoneSecurityData)));
    }
    value = object.updateCacheHandlerKey;
    if (value != null) {
      result
        ..add('updateCacheHandlerKey')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.updateCacheHandlerContext;
    if (value != null) {
      result
        ..add('updateCacheHandlerContext')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                Map, const [const FullType(String), const FullType(dynamic)])));
    }
    value = object.fetchPolicy;
    if (value != null) {
      result
        ..add('fetchPolicy')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(_i1.FetchPolicy)));
    }
    return result;
  }

  @override
  GcreatePhoneSecurityReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GcreatePhoneSecurityReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GcreatePhoneSecurityVars))!
              as _i3.GcreatePhoneSecurityVars);
          break;
        case 'operation':
          result.operation = serializers.deserialize(value,
              specifiedType: const FullType(_i4.Operation)) as _i4.Operation;
          break;
        case 'requestId':
          result.requestId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'optimisticResponse':
          result.optimisticResponse.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i2.GcreatePhoneSecurityData))!
              as _i2.GcreatePhoneSecurityData);
          break;
        case 'updateCacheHandlerKey':
          result.updateCacheHandlerKey = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'updateCacheHandlerContext':
          result.updateCacheHandlerContext = serializers.deserialize(value,
              specifiedType: const FullType(Map, const [
                const FullType(String),
                const FullType(dynamic)
              ])) as Map<String, dynamic>;
          break;
        case 'fetchPolicy':
          result.fetchPolicy = serializers.deserialize(value,
                  specifiedType: const FullType(_i1.FetchPolicy))
              as _i1.FetchPolicy;
          break;
        case 'executeOnListen':
          result.executeOnListen = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GcreatePhoneSecurityOfViewerReqSerializer
    implements StructuredSerializer<GcreatePhoneSecurityOfViewerReq> {
  @override
  final Iterable<Type> types = const [
    GcreatePhoneSecurityOfViewerReq,
    _$GcreatePhoneSecurityOfViewerReq
  ];
  @override
  final String wireName = 'GcreatePhoneSecurityOfViewerReq';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GcreatePhoneSecurityOfViewerReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GcreatePhoneSecurityOfViewerVars)),
      'operation',
      serializers.serialize(object.operation,
          specifiedType: const FullType(_i4.Operation)),
      'executeOnListen',
      serializers.serialize(object.executeOnListen,
          specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.requestId;
    if (value != null) {
      result
        ..add('requestId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.optimisticResponse;
    if (value != null) {
      result
        ..add('optimisticResponse')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(_i2.GcreatePhoneSecurityOfViewerData)));
    }
    value = object.updateCacheHandlerKey;
    if (value != null) {
      result
        ..add('updateCacheHandlerKey')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.updateCacheHandlerContext;
    if (value != null) {
      result
        ..add('updateCacheHandlerContext')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                Map, const [const FullType(String), const FullType(dynamic)])));
    }
    value = object.fetchPolicy;
    if (value != null) {
      result
        ..add('fetchPolicy')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(_i1.FetchPolicy)));
    }
    return result;
  }

  @override
  GcreatePhoneSecurityOfViewerReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GcreatePhoneSecurityOfViewerReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(_i3.GcreatePhoneSecurityOfViewerVars))!
              as _i3.GcreatePhoneSecurityOfViewerVars);
          break;
        case 'operation':
          result.operation = serializers.deserialize(value,
              specifiedType: const FullType(_i4.Operation)) as _i4.Operation;
          break;
        case 'requestId':
          result.requestId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'optimisticResponse':
          result.optimisticResponse.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(_i2.GcreatePhoneSecurityOfViewerData))!
              as _i2.GcreatePhoneSecurityOfViewerData);
          break;
        case 'updateCacheHandlerKey':
          result.updateCacheHandlerKey = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'updateCacheHandlerContext':
          result.updateCacheHandlerContext = serializers.deserialize(value,
              specifiedType: const FullType(Map, const [
                const FullType(String),
                const FullType(dynamic)
              ])) as Map<String, dynamic>;
          break;
        case 'fetchPolicy':
          result.fetchPolicy = serializers.deserialize(value,
                  specifiedType: const FullType(_i1.FetchPolicy))
              as _i1.FetchPolicy;
          break;
        case 'executeOnListen':
          result.executeOnListen = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GcreatePhoneSecurityReq extends GcreatePhoneSecurityReq {
  @override
  final _i3.GcreatePhoneSecurityVars vars;
  @override
  final _i4.Operation operation;
  @override
  final String? requestId;
  @override
  final _i2.GcreatePhoneSecurityData? Function(
          _i2.GcreatePhoneSecurityData?, _i2.GcreatePhoneSecurityData?)?
      updateResult;
  @override
  final _i2.GcreatePhoneSecurityData? optimisticResponse;
  @override
  final String? updateCacheHandlerKey;
  @override
  final Map<String, dynamic>? updateCacheHandlerContext;
  @override
  final _i1.FetchPolicy? fetchPolicy;
  @override
  final bool executeOnListen;

  factory _$GcreatePhoneSecurityReq(
          [void Function(GcreatePhoneSecurityReqBuilder)? updates]) =>
      (new GcreatePhoneSecurityReqBuilder()..update(updates)).build();

  _$GcreatePhoneSecurityReq._(
      {required this.vars,
      required this.operation,
      this.requestId,
      this.updateResult,
      this.optimisticResponse,
      this.updateCacheHandlerKey,
      this.updateCacheHandlerContext,
      this.fetchPolicy,
      required this.executeOnListen})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        vars, 'GcreatePhoneSecurityReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, 'GcreatePhoneSecurityReq', 'operation');
    BuiltValueNullFieldError.checkNotNull(
        executeOnListen, 'GcreatePhoneSecurityReq', 'executeOnListen');
  }

  @override
  GcreatePhoneSecurityReq rebuild(
          void Function(GcreatePhoneSecurityReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GcreatePhoneSecurityReqBuilder toBuilder() =>
      new GcreatePhoneSecurityReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is GcreatePhoneSecurityReq &&
        vars == other.vars &&
        operation == other.operation &&
        requestId == other.requestId &&
        updateResult == _$dynamicOther.updateResult &&
        optimisticResponse == other.optimisticResponse &&
        updateCacheHandlerKey == other.updateCacheHandlerKey &&
        updateCacheHandlerContext == other.updateCacheHandlerContext &&
        fetchPolicy == other.fetchPolicy &&
        executeOnListen == other.executeOnListen;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, vars.hashCode), operation.hashCode),
                                requestId.hashCode),
                            updateResult.hashCode),
                        optimisticResponse.hashCode),
                    updateCacheHandlerKey.hashCode),
                updateCacheHandlerContext.hashCode),
            fetchPolicy.hashCode),
        executeOnListen.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GcreatePhoneSecurityReq')
          ..add('vars', vars)
          ..add('operation', operation)
          ..add('requestId', requestId)
          ..add('updateResult', updateResult)
          ..add('optimisticResponse', optimisticResponse)
          ..add('updateCacheHandlerKey', updateCacheHandlerKey)
          ..add('updateCacheHandlerContext', updateCacheHandlerContext)
          ..add('fetchPolicy', fetchPolicy)
          ..add('executeOnListen', executeOnListen))
        .toString();
  }
}

class GcreatePhoneSecurityReqBuilder
    implements
        Builder<GcreatePhoneSecurityReq, GcreatePhoneSecurityReqBuilder> {
  _$GcreatePhoneSecurityReq? _$v;

  _i3.GcreatePhoneSecurityVarsBuilder? _vars;
  _i3.GcreatePhoneSecurityVarsBuilder get vars =>
      _$this._vars ??= new _i3.GcreatePhoneSecurityVarsBuilder();
  set vars(_i3.GcreatePhoneSecurityVarsBuilder? vars) => _$this._vars = vars;

  _i4.Operation? _operation;
  _i4.Operation? get operation => _$this._operation;
  set operation(_i4.Operation? operation) => _$this._operation = operation;

  String? _requestId;
  String? get requestId => _$this._requestId;
  set requestId(String? requestId) => _$this._requestId = requestId;

  _i2.GcreatePhoneSecurityData? Function(
          _i2.GcreatePhoneSecurityData?, _i2.GcreatePhoneSecurityData?)?
      _updateResult;
  _i2.GcreatePhoneSecurityData? Function(
          _i2.GcreatePhoneSecurityData?, _i2.GcreatePhoneSecurityData?)?
      get updateResult => _$this._updateResult;
  set updateResult(
          _i2.GcreatePhoneSecurityData? Function(
                  _i2.GcreatePhoneSecurityData?, _i2.GcreatePhoneSecurityData?)?
              updateResult) =>
      _$this._updateResult = updateResult;

  _i2.GcreatePhoneSecurityDataBuilder? _optimisticResponse;
  _i2.GcreatePhoneSecurityDataBuilder get optimisticResponse =>
      _$this._optimisticResponse ??= new _i2.GcreatePhoneSecurityDataBuilder();
  set optimisticResponse(
          _i2.GcreatePhoneSecurityDataBuilder? optimisticResponse) =>
      _$this._optimisticResponse = optimisticResponse;

  String? _updateCacheHandlerKey;
  String? get updateCacheHandlerKey => _$this._updateCacheHandlerKey;
  set updateCacheHandlerKey(String? updateCacheHandlerKey) =>
      _$this._updateCacheHandlerKey = updateCacheHandlerKey;

  Map<String, dynamic>? _updateCacheHandlerContext;
  Map<String, dynamic>? get updateCacheHandlerContext =>
      _$this._updateCacheHandlerContext;
  set updateCacheHandlerContext(
          Map<String, dynamic>? updateCacheHandlerContext) =>
      _$this._updateCacheHandlerContext = updateCacheHandlerContext;

  _i1.FetchPolicy? _fetchPolicy;
  _i1.FetchPolicy? get fetchPolicy => _$this._fetchPolicy;
  set fetchPolicy(_i1.FetchPolicy? fetchPolicy) =>
      _$this._fetchPolicy = fetchPolicy;

  bool? _executeOnListen;
  bool? get executeOnListen => _$this._executeOnListen;
  set executeOnListen(bool? executeOnListen) =>
      _$this._executeOnListen = executeOnListen;

  GcreatePhoneSecurityReqBuilder() {
    GcreatePhoneSecurityReq._initializeBuilder(this);
  }

  GcreatePhoneSecurityReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _operation = $v.operation;
      _requestId = $v.requestId;
      _updateResult = $v.updateResult;
      _optimisticResponse = $v.optimisticResponse?.toBuilder();
      _updateCacheHandlerKey = $v.updateCacheHandlerKey;
      _updateCacheHandlerContext = $v.updateCacheHandlerContext;
      _fetchPolicy = $v.fetchPolicy;
      _executeOnListen = $v.executeOnListen;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GcreatePhoneSecurityReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GcreatePhoneSecurityReq;
  }

  @override
  void update(void Function(GcreatePhoneSecurityReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GcreatePhoneSecurityReq build() {
    _$GcreatePhoneSecurityReq _$result;
    try {
      _$result = _$v ??
          new _$GcreatePhoneSecurityReq._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, 'GcreatePhoneSecurityReq', 'operation'),
              requestId: requestId,
              updateResult: updateResult,
              optimisticResponse: _optimisticResponse?.build(),
              updateCacheHandlerKey: updateCacheHandlerKey,
              updateCacheHandlerContext: updateCacheHandlerContext,
              fetchPolicy: fetchPolicy,
              executeOnListen: BuiltValueNullFieldError.checkNotNull(
                  executeOnListen,
                  'GcreatePhoneSecurityReq',
                  'executeOnListen'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();

        _$failedField = 'optimisticResponse';
        _optimisticResponse?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GcreatePhoneSecurityReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GcreatePhoneSecurityOfViewerReq
    extends GcreatePhoneSecurityOfViewerReq {
  @override
  final _i3.GcreatePhoneSecurityOfViewerVars vars;
  @override
  final _i4.Operation operation;
  @override
  final String? requestId;
  @override
  final _i2.GcreatePhoneSecurityOfViewerData? Function(
      _i2.GcreatePhoneSecurityOfViewerData?,
      _i2.GcreatePhoneSecurityOfViewerData?)? updateResult;
  @override
  final _i2.GcreatePhoneSecurityOfViewerData? optimisticResponse;
  @override
  final String? updateCacheHandlerKey;
  @override
  final Map<String, dynamic>? updateCacheHandlerContext;
  @override
  final _i1.FetchPolicy? fetchPolicy;
  @override
  final bool executeOnListen;

  factory _$GcreatePhoneSecurityOfViewerReq(
          [void Function(GcreatePhoneSecurityOfViewerReqBuilder)? updates]) =>
      (new GcreatePhoneSecurityOfViewerReqBuilder()..update(updates)).build();

  _$GcreatePhoneSecurityOfViewerReq._(
      {required this.vars,
      required this.operation,
      this.requestId,
      this.updateResult,
      this.optimisticResponse,
      this.updateCacheHandlerKey,
      this.updateCacheHandlerContext,
      this.fetchPolicy,
      required this.executeOnListen})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        vars, 'GcreatePhoneSecurityOfViewerReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, 'GcreatePhoneSecurityOfViewerReq', 'operation');
    BuiltValueNullFieldError.checkNotNull(
        executeOnListen, 'GcreatePhoneSecurityOfViewerReq', 'executeOnListen');
  }

  @override
  GcreatePhoneSecurityOfViewerReq rebuild(
          void Function(GcreatePhoneSecurityOfViewerReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GcreatePhoneSecurityOfViewerReqBuilder toBuilder() =>
      new GcreatePhoneSecurityOfViewerReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is GcreatePhoneSecurityOfViewerReq &&
        vars == other.vars &&
        operation == other.operation &&
        requestId == other.requestId &&
        updateResult == _$dynamicOther.updateResult &&
        optimisticResponse == other.optimisticResponse &&
        updateCacheHandlerKey == other.updateCacheHandlerKey &&
        updateCacheHandlerContext == other.updateCacheHandlerContext &&
        fetchPolicy == other.fetchPolicy &&
        executeOnListen == other.executeOnListen;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, vars.hashCode), operation.hashCode),
                                requestId.hashCode),
                            updateResult.hashCode),
                        optimisticResponse.hashCode),
                    updateCacheHandlerKey.hashCode),
                updateCacheHandlerContext.hashCode),
            fetchPolicy.hashCode),
        executeOnListen.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GcreatePhoneSecurityOfViewerReq')
          ..add('vars', vars)
          ..add('operation', operation)
          ..add('requestId', requestId)
          ..add('updateResult', updateResult)
          ..add('optimisticResponse', optimisticResponse)
          ..add('updateCacheHandlerKey', updateCacheHandlerKey)
          ..add('updateCacheHandlerContext', updateCacheHandlerContext)
          ..add('fetchPolicy', fetchPolicy)
          ..add('executeOnListen', executeOnListen))
        .toString();
  }
}

class GcreatePhoneSecurityOfViewerReqBuilder
    implements
        Builder<GcreatePhoneSecurityOfViewerReq,
            GcreatePhoneSecurityOfViewerReqBuilder> {
  _$GcreatePhoneSecurityOfViewerReq? _$v;

  _i3.GcreatePhoneSecurityOfViewerVarsBuilder? _vars;
  _i3.GcreatePhoneSecurityOfViewerVarsBuilder get vars =>
      _$this._vars ??= new _i3.GcreatePhoneSecurityOfViewerVarsBuilder();
  set vars(_i3.GcreatePhoneSecurityOfViewerVarsBuilder? vars) =>
      _$this._vars = vars;

  _i4.Operation? _operation;
  _i4.Operation? get operation => _$this._operation;
  set operation(_i4.Operation? operation) => _$this._operation = operation;

  String? _requestId;
  String? get requestId => _$this._requestId;
  set requestId(String? requestId) => _$this._requestId = requestId;

  _i2.GcreatePhoneSecurityOfViewerData? Function(
      _i2.GcreatePhoneSecurityOfViewerData?,
      _i2.GcreatePhoneSecurityOfViewerData?)? _updateResult;
  _i2.GcreatePhoneSecurityOfViewerData? Function(
          _i2.GcreatePhoneSecurityOfViewerData?,
          _i2.GcreatePhoneSecurityOfViewerData?)?
      get updateResult => _$this._updateResult;
  set updateResult(
          _i2.GcreatePhoneSecurityOfViewerData? Function(
                  _i2.GcreatePhoneSecurityOfViewerData?,
                  _i2.GcreatePhoneSecurityOfViewerData?)?
              updateResult) =>
      _$this._updateResult = updateResult;

  _i2.GcreatePhoneSecurityOfViewerDataBuilder? _optimisticResponse;
  _i2.GcreatePhoneSecurityOfViewerDataBuilder get optimisticResponse =>
      _$this._optimisticResponse ??=
          new _i2.GcreatePhoneSecurityOfViewerDataBuilder();
  set optimisticResponse(
          _i2.GcreatePhoneSecurityOfViewerDataBuilder? optimisticResponse) =>
      _$this._optimisticResponse = optimisticResponse;

  String? _updateCacheHandlerKey;
  String? get updateCacheHandlerKey => _$this._updateCacheHandlerKey;
  set updateCacheHandlerKey(String? updateCacheHandlerKey) =>
      _$this._updateCacheHandlerKey = updateCacheHandlerKey;

  Map<String, dynamic>? _updateCacheHandlerContext;
  Map<String, dynamic>? get updateCacheHandlerContext =>
      _$this._updateCacheHandlerContext;
  set updateCacheHandlerContext(
          Map<String, dynamic>? updateCacheHandlerContext) =>
      _$this._updateCacheHandlerContext = updateCacheHandlerContext;

  _i1.FetchPolicy? _fetchPolicy;
  _i1.FetchPolicy? get fetchPolicy => _$this._fetchPolicy;
  set fetchPolicy(_i1.FetchPolicy? fetchPolicy) =>
      _$this._fetchPolicy = fetchPolicy;

  bool? _executeOnListen;
  bool? get executeOnListen => _$this._executeOnListen;
  set executeOnListen(bool? executeOnListen) =>
      _$this._executeOnListen = executeOnListen;

  GcreatePhoneSecurityOfViewerReqBuilder() {
    GcreatePhoneSecurityOfViewerReq._initializeBuilder(this);
  }

  GcreatePhoneSecurityOfViewerReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _operation = $v.operation;
      _requestId = $v.requestId;
      _updateResult = $v.updateResult;
      _optimisticResponse = $v.optimisticResponse?.toBuilder();
      _updateCacheHandlerKey = $v.updateCacheHandlerKey;
      _updateCacheHandlerContext = $v.updateCacheHandlerContext;
      _fetchPolicy = $v.fetchPolicy;
      _executeOnListen = $v.executeOnListen;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GcreatePhoneSecurityOfViewerReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GcreatePhoneSecurityOfViewerReq;
  }

  @override
  void update(void Function(GcreatePhoneSecurityOfViewerReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GcreatePhoneSecurityOfViewerReq build() {
    _$GcreatePhoneSecurityOfViewerReq _$result;
    try {
      _$result = _$v ??
          new _$GcreatePhoneSecurityOfViewerReq._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, 'GcreatePhoneSecurityOfViewerReq', 'operation'),
              requestId: requestId,
              updateResult: updateResult,
              optimisticResponse: _optimisticResponse?.build(),
              updateCacheHandlerKey: updateCacheHandlerKey,
              updateCacheHandlerContext: updateCacheHandlerContext,
              fetchPolicy: fetchPolicy,
              executeOnListen: BuiltValueNullFieldError.checkNotNull(
                  executeOnListen,
                  'GcreatePhoneSecurityOfViewerReq',
                  'executeOnListen'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();

        _$failedField = 'optimisticResponse';
        _optimisticResponse?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GcreatePhoneSecurityOfViewerReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
