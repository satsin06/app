// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mutations.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GCreatePhoneSecurityReq> _$gCreatePhoneSecurityReqSerializer =
    new _$GCreatePhoneSecurityReqSerializer();
Serializer<GCreatePhoneSecurityOfViewerReq>
    _$gCreatePhoneSecurityOfViewerReqSerializer =
    new _$GCreatePhoneSecurityOfViewerReqSerializer();
Serializer<GCreateAuthorizationTokenReq>
    _$gCreateAuthorizationTokenReqSerializer =
    new _$GCreateAuthorizationTokenReqSerializer();

class _$GCreatePhoneSecurityReqSerializer
    implements StructuredSerializer<GCreatePhoneSecurityReq> {
  @override
  final Iterable<Type> types = const [
    GCreatePhoneSecurityReq,
    _$GCreatePhoneSecurityReq
  ];
  @override
  final String wireName = 'GCreatePhoneSecurityReq';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreatePhoneSecurityReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GCreatePhoneSecurityVars)),
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
            specifiedType: const FullType(_i2.GCreatePhoneSecurityData)));
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
  GCreatePhoneSecurityReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreatePhoneSecurityReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GCreatePhoneSecurityVars))!
              as _i3.GCreatePhoneSecurityVars);
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
                  specifiedType: const FullType(_i2.GCreatePhoneSecurityData))!
              as _i2.GCreatePhoneSecurityData);
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

class _$GCreatePhoneSecurityOfViewerReqSerializer
    implements StructuredSerializer<GCreatePhoneSecurityOfViewerReq> {
  @override
  final Iterable<Type> types = const [
    GCreatePhoneSecurityOfViewerReq,
    _$GCreatePhoneSecurityOfViewerReq
  ];
  @override
  final String wireName = 'GCreatePhoneSecurityOfViewerReq';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreatePhoneSecurityOfViewerReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GCreatePhoneSecurityOfViewerVars)),
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
                const FullType(_i2.GCreatePhoneSecurityOfViewerData)));
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
  GCreatePhoneSecurityOfViewerReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreatePhoneSecurityOfViewerReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(_i3.GCreatePhoneSecurityOfViewerVars))!
              as _i3.GCreatePhoneSecurityOfViewerVars);
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
                      const FullType(_i2.GCreatePhoneSecurityOfViewerData))!
              as _i2.GCreatePhoneSecurityOfViewerData);
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

class _$GCreateAuthorizationTokenReqSerializer
    implements StructuredSerializer<GCreateAuthorizationTokenReq> {
  @override
  final Iterable<Type> types = const [
    GCreateAuthorizationTokenReq,
    _$GCreateAuthorizationTokenReq
  ];
  @override
  final String wireName = 'GCreateAuthorizationTokenReq';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateAuthorizationTokenReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GCreateAuthorizationTokenVars)),
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
            specifiedType: const FullType(_i2.GCreateAuthorizationTokenData)));
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
  GCreateAuthorizationTokenReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateAuthorizationTokenReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(_i3.GCreateAuthorizationTokenVars))!
              as _i3.GCreateAuthorizationTokenVars);
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
                      const FullType(_i2.GCreateAuthorizationTokenData))!
              as _i2.GCreateAuthorizationTokenData);
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

class _$GCreatePhoneSecurityReq extends GCreatePhoneSecurityReq {
  @override
  final _i3.GCreatePhoneSecurityVars vars;
  @override
  final _i4.Operation operation;
  @override
  final String? requestId;
  @override
  final _i2.GCreatePhoneSecurityData? Function(
          _i2.GCreatePhoneSecurityData?, _i2.GCreatePhoneSecurityData?)?
      updateResult;
  @override
  final _i2.GCreatePhoneSecurityData? optimisticResponse;
  @override
  final String? updateCacheHandlerKey;
  @override
  final Map<String, dynamic>? updateCacheHandlerContext;
  @override
  final _i1.FetchPolicy? fetchPolicy;
  @override
  final bool executeOnListen;

  factory _$GCreatePhoneSecurityReq(
          [void Function(GCreatePhoneSecurityReqBuilder)? updates]) =>
      (new GCreatePhoneSecurityReqBuilder()..update(updates)).build();

  _$GCreatePhoneSecurityReq._(
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
        vars, 'GCreatePhoneSecurityReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, 'GCreatePhoneSecurityReq', 'operation');
    BuiltValueNullFieldError.checkNotNull(
        executeOnListen, 'GCreatePhoneSecurityReq', 'executeOnListen');
  }

  @override
  GCreatePhoneSecurityReq rebuild(
          void Function(GCreatePhoneSecurityReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreatePhoneSecurityReqBuilder toBuilder() =>
      new GCreatePhoneSecurityReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is GCreatePhoneSecurityReq &&
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
    return (newBuiltValueToStringHelper('GCreatePhoneSecurityReq')
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

class GCreatePhoneSecurityReqBuilder
    implements
        Builder<GCreatePhoneSecurityReq, GCreatePhoneSecurityReqBuilder> {
  _$GCreatePhoneSecurityReq? _$v;

  _i3.GCreatePhoneSecurityVarsBuilder? _vars;
  _i3.GCreatePhoneSecurityVarsBuilder get vars =>
      _$this._vars ??= new _i3.GCreatePhoneSecurityVarsBuilder();
  set vars(_i3.GCreatePhoneSecurityVarsBuilder? vars) => _$this._vars = vars;

  _i4.Operation? _operation;
  _i4.Operation? get operation => _$this._operation;
  set operation(_i4.Operation? operation) => _$this._operation = operation;

  String? _requestId;
  String? get requestId => _$this._requestId;
  set requestId(String? requestId) => _$this._requestId = requestId;

  _i2.GCreatePhoneSecurityData? Function(
          _i2.GCreatePhoneSecurityData?, _i2.GCreatePhoneSecurityData?)?
      _updateResult;
  _i2.GCreatePhoneSecurityData? Function(
          _i2.GCreatePhoneSecurityData?, _i2.GCreatePhoneSecurityData?)?
      get updateResult => _$this._updateResult;
  set updateResult(
          _i2.GCreatePhoneSecurityData? Function(
                  _i2.GCreatePhoneSecurityData?, _i2.GCreatePhoneSecurityData?)?
              updateResult) =>
      _$this._updateResult = updateResult;

  _i2.GCreatePhoneSecurityDataBuilder? _optimisticResponse;
  _i2.GCreatePhoneSecurityDataBuilder get optimisticResponse =>
      _$this._optimisticResponse ??= new _i2.GCreatePhoneSecurityDataBuilder();
  set optimisticResponse(
          _i2.GCreatePhoneSecurityDataBuilder? optimisticResponse) =>
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

  GCreatePhoneSecurityReqBuilder() {
    GCreatePhoneSecurityReq._initializeBuilder(this);
  }

  GCreatePhoneSecurityReqBuilder get _$this {
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
  void replace(GCreatePhoneSecurityReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreatePhoneSecurityReq;
  }

  @override
  void update(void Function(GCreatePhoneSecurityReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GCreatePhoneSecurityReq build() {
    _$GCreatePhoneSecurityReq _$result;
    try {
      _$result = _$v ??
          new _$GCreatePhoneSecurityReq._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, 'GCreatePhoneSecurityReq', 'operation'),
              requestId: requestId,
              updateResult: updateResult,
              optimisticResponse: _optimisticResponse?.build(),
              updateCacheHandlerKey: updateCacheHandlerKey,
              updateCacheHandlerContext: updateCacheHandlerContext,
              fetchPolicy: fetchPolicy,
              executeOnListen: BuiltValueNullFieldError.checkNotNull(
                  executeOnListen,
                  'GCreatePhoneSecurityReq',
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
            'GCreatePhoneSecurityReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GCreatePhoneSecurityOfViewerReq
    extends GCreatePhoneSecurityOfViewerReq {
  @override
  final _i3.GCreatePhoneSecurityOfViewerVars vars;
  @override
  final _i4.Operation operation;
  @override
  final String? requestId;
  @override
  final _i2.GCreatePhoneSecurityOfViewerData? Function(
      _i2.GCreatePhoneSecurityOfViewerData?,
      _i2.GCreatePhoneSecurityOfViewerData?)? updateResult;
  @override
  final _i2.GCreatePhoneSecurityOfViewerData? optimisticResponse;
  @override
  final String? updateCacheHandlerKey;
  @override
  final Map<String, dynamic>? updateCacheHandlerContext;
  @override
  final _i1.FetchPolicy? fetchPolicy;
  @override
  final bool executeOnListen;

  factory _$GCreatePhoneSecurityOfViewerReq(
          [void Function(GCreatePhoneSecurityOfViewerReqBuilder)? updates]) =>
      (new GCreatePhoneSecurityOfViewerReqBuilder()..update(updates)).build();

  _$GCreatePhoneSecurityOfViewerReq._(
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
        vars, 'GCreatePhoneSecurityOfViewerReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, 'GCreatePhoneSecurityOfViewerReq', 'operation');
    BuiltValueNullFieldError.checkNotNull(
        executeOnListen, 'GCreatePhoneSecurityOfViewerReq', 'executeOnListen');
  }

  @override
  GCreatePhoneSecurityOfViewerReq rebuild(
          void Function(GCreatePhoneSecurityOfViewerReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreatePhoneSecurityOfViewerReqBuilder toBuilder() =>
      new GCreatePhoneSecurityOfViewerReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is GCreatePhoneSecurityOfViewerReq &&
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
    return (newBuiltValueToStringHelper('GCreatePhoneSecurityOfViewerReq')
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

class GCreatePhoneSecurityOfViewerReqBuilder
    implements
        Builder<GCreatePhoneSecurityOfViewerReq,
            GCreatePhoneSecurityOfViewerReqBuilder> {
  _$GCreatePhoneSecurityOfViewerReq? _$v;

  _i3.GCreatePhoneSecurityOfViewerVarsBuilder? _vars;
  _i3.GCreatePhoneSecurityOfViewerVarsBuilder get vars =>
      _$this._vars ??= new _i3.GCreatePhoneSecurityOfViewerVarsBuilder();
  set vars(_i3.GCreatePhoneSecurityOfViewerVarsBuilder? vars) =>
      _$this._vars = vars;

  _i4.Operation? _operation;
  _i4.Operation? get operation => _$this._operation;
  set operation(_i4.Operation? operation) => _$this._operation = operation;

  String? _requestId;
  String? get requestId => _$this._requestId;
  set requestId(String? requestId) => _$this._requestId = requestId;

  _i2.GCreatePhoneSecurityOfViewerData? Function(
      _i2.GCreatePhoneSecurityOfViewerData?,
      _i2.GCreatePhoneSecurityOfViewerData?)? _updateResult;
  _i2.GCreatePhoneSecurityOfViewerData? Function(
          _i2.GCreatePhoneSecurityOfViewerData?,
          _i2.GCreatePhoneSecurityOfViewerData?)?
      get updateResult => _$this._updateResult;
  set updateResult(
          _i2.GCreatePhoneSecurityOfViewerData? Function(
                  _i2.GCreatePhoneSecurityOfViewerData?,
                  _i2.GCreatePhoneSecurityOfViewerData?)?
              updateResult) =>
      _$this._updateResult = updateResult;

  _i2.GCreatePhoneSecurityOfViewerDataBuilder? _optimisticResponse;
  _i2.GCreatePhoneSecurityOfViewerDataBuilder get optimisticResponse =>
      _$this._optimisticResponse ??=
          new _i2.GCreatePhoneSecurityOfViewerDataBuilder();
  set optimisticResponse(
          _i2.GCreatePhoneSecurityOfViewerDataBuilder? optimisticResponse) =>
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

  GCreatePhoneSecurityOfViewerReqBuilder() {
    GCreatePhoneSecurityOfViewerReq._initializeBuilder(this);
  }

  GCreatePhoneSecurityOfViewerReqBuilder get _$this {
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
  void replace(GCreatePhoneSecurityOfViewerReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreatePhoneSecurityOfViewerReq;
  }

  @override
  void update(void Function(GCreatePhoneSecurityOfViewerReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GCreatePhoneSecurityOfViewerReq build() {
    _$GCreatePhoneSecurityOfViewerReq _$result;
    try {
      _$result = _$v ??
          new _$GCreatePhoneSecurityOfViewerReq._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, 'GCreatePhoneSecurityOfViewerReq', 'operation'),
              requestId: requestId,
              updateResult: updateResult,
              optimisticResponse: _optimisticResponse?.build(),
              updateCacheHandlerKey: updateCacheHandlerKey,
              updateCacheHandlerContext: updateCacheHandlerContext,
              fetchPolicy: fetchPolicy,
              executeOnListen: BuiltValueNullFieldError.checkNotNull(
                  executeOnListen,
                  'GCreatePhoneSecurityOfViewerReq',
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
            'GCreatePhoneSecurityOfViewerReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GCreateAuthorizationTokenReq extends GCreateAuthorizationTokenReq {
  @override
  final _i3.GCreateAuthorizationTokenVars vars;
  @override
  final _i4.Operation operation;
  @override
  final String? requestId;
  @override
  final _i2.GCreateAuthorizationTokenData? Function(
      _i2.GCreateAuthorizationTokenData?,
      _i2.GCreateAuthorizationTokenData?)? updateResult;
  @override
  final _i2.GCreateAuthorizationTokenData? optimisticResponse;
  @override
  final String? updateCacheHandlerKey;
  @override
  final Map<String, dynamic>? updateCacheHandlerContext;
  @override
  final _i1.FetchPolicy? fetchPolicy;
  @override
  final bool executeOnListen;

  factory _$GCreateAuthorizationTokenReq(
          [void Function(GCreateAuthorizationTokenReqBuilder)? updates]) =>
      (new GCreateAuthorizationTokenReqBuilder()..update(updates)).build();

  _$GCreateAuthorizationTokenReq._(
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
        vars, 'GCreateAuthorizationTokenReq', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, 'GCreateAuthorizationTokenReq', 'operation');
    BuiltValueNullFieldError.checkNotNull(
        executeOnListen, 'GCreateAuthorizationTokenReq', 'executeOnListen');
  }

  @override
  GCreateAuthorizationTokenReq rebuild(
          void Function(GCreateAuthorizationTokenReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateAuthorizationTokenReqBuilder toBuilder() =>
      new GCreateAuthorizationTokenReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is GCreateAuthorizationTokenReq &&
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
    return (newBuiltValueToStringHelper('GCreateAuthorizationTokenReq')
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

class GCreateAuthorizationTokenReqBuilder
    implements
        Builder<GCreateAuthorizationTokenReq,
            GCreateAuthorizationTokenReqBuilder> {
  _$GCreateAuthorizationTokenReq? _$v;

  _i3.GCreateAuthorizationTokenVarsBuilder? _vars;
  _i3.GCreateAuthorizationTokenVarsBuilder get vars =>
      _$this._vars ??= new _i3.GCreateAuthorizationTokenVarsBuilder();
  set vars(_i3.GCreateAuthorizationTokenVarsBuilder? vars) =>
      _$this._vars = vars;

  _i4.Operation? _operation;
  _i4.Operation? get operation => _$this._operation;
  set operation(_i4.Operation? operation) => _$this._operation = operation;

  String? _requestId;
  String? get requestId => _$this._requestId;
  set requestId(String? requestId) => _$this._requestId = requestId;

  _i2.GCreateAuthorizationTokenData? Function(
      _i2.GCreateAuthorizationTokenData?,
      _i2.GCreateAuthorizationTokenData?)? _updateResult;
  _i2.GCreateAuthorizationTokenData? Function(
          _i2.GCreateAuthorizationTokenData?,
          _i2.GCreateAuthorizationTokenData?)?
      get updateResult => _$this._updateResult;
  set updateResult(
          _i2.GCreateAuthorizationTokenData? Function(
                  _i2.GCreateAuthorizationTokenData?,
                  _i2.GCreateAuthorizationTokenData?)?
              updateResult) =>
      _$this._updateResult = updateResult;

  _i2.GCreateAuthorizationTokenDataBuilder? _optimisticResponse;
  _i2.GCreateAuthorizationTokenDataBuilder get optimisticResponse =>
      _$this._optimisticResponse ??=
          new _i2.GCreateAuthorizationTokenDataBuilder();
  set optimisticResponse(
          _i2.GCreateAuthorizationTokenDataBuilder? optimisticResponse) =>
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

  GCreateAuthorizationTokenReqBuilder() {
    GCreateAuthorizationTokenReq._initializeBuilder(this);
  }

  GCreateAuthorizationTokenReqBuilder get _$this {
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
  void replace(GCreateAuthorizationTokenReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateAuthorizationTokenReq;
  }

  @override
  void update(void Function(GCreateAuthorizationTokenReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GCreateAuthorizationTokenReq build() {
    _$GCreateAuthorizationTokenReq _$result;
    try {
      _$result = _$v ??
          new _$GCreateAuthorizationTokenReq._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, 'GCreateAuthorizationTokenReq', 'operation'),
              requestId: requestId,
              updateResult: updateResult,
              optimisticResponse: _optimisticResponse?.build(),
              updateCacheHandlerKey: updateCacheHandlerKey,
              updateCacheHandlerContext: updateCacheHandlerContext,
              fetchPolicy: fetchPolicy,
              executeOnListen: BuiltValueNullFieldError.checkNotNull(
                  executeOnListen,
                  'GCreateAuthorizationTokenReq',
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
            'GCreateAuthorizationTokenReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
