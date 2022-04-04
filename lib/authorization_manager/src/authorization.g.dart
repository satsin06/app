// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorization.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetAuthorizationCollection on Isar {
  IsarCollection<Authorization> get authorizations {
    return getCollection('Authorization');
  }
}

final AuthorizationSchema = CollectionSchema(
  name: 'Authorization',
  schema:
      '{"name":"Authorization","idName":"\$id","properties":[{"name":"\$type","type":"String"},{"name":"expiredAt","type":"Long"},{"name":"payload","type":"String"},{"name":"token","type":"String"}],"indexes":[{"name":"\$type","unique":true,"properties":[{"name":"\$type","type":"Hash","caseSensitive":true}]},{"name":"token","unique":true,"properties":[{"name":"token","type":"Hash","caseSensitive":true}]}],"links":[]}',
  nativeAdapter: const _AuthorizationNativeAdapter(),
  webAdapter: const _AuthorizationWebAdapter(),
  idName: '\$id',
  propertyIds: {'\$type': 0, 'expiredAt': 1, 'payload': 2, 'token': 3},
  listProperties: {},
  indexIds: {'\$type': 0, 'token': 1},
  indexTypes: {
    '\$type': [
      NativeIndexType.stringHash,
    ],
    'token': [
      NativeIndexType.stringHash,
    ]
  },
  linkIds: {},
  backlinkIds: {},
  linkedCollections: [],
  getId: (obj) {
    if (obj.$id == Isar.autoIncrement) {
      return null;
    } else {
      return obj.$id;
    }
  },
  setId: (obj, id) => obj.$id = id,
  getLinks: (obj) => [],
  version: 2,
);

class _AuthorizationWebAdapter extends IsarWebTypeAdapter<Authorization> {
  const _AuthorizationWebAdapter();

  @override
  Object serialize(
      IsarCollection<Authorization> collection, Authorization object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(jsObj, '\$id', object.$id);
    IsarNative.jsObjectSet(jsObj, '\$type', object.$type);
    IsarNative.jsObjectSet(
        jsObj, 'expiredAt', object.expiredAt.toUtc().millisecondsSinceEpoch);
    IsarNative.jsObjectSet(jsObj, 'payload', object.payload);
    IsarNative.jsObjectSet(jsObj, 'token', object.token);
    return jsObj;
  }

  @override
  Authorization deserialize(
      IsarCollection<Authorization> collection, dynamic jsObj) {
    final object = Authorization();
    object.$id = IsarNative.jsObjectGet(jsObj, '\$id');
    object.$type = IsarNative.jsObjectGet(jsObj, '\$type') ?? '';
    object.expiredAt = IsarNative.jsObjectGet(jsObj, 'expiredAt') != null
        ? DateTime.fromMillisecondsSinceEpoch(
                IsarNative.jsObjectGet(jsObj, 'expiredAt'),
                isUtc: true)
            .toLocal()
        : DateTime.fromMillisecondsSinceEpoch(0);
    object.payload = IsarNative.jsObjectGet(jsObj, 'payload');
    object.token = IsarNative.jsObjectGet(jsObj, 'token') ?? '';
    return object;
  }

  @override
  P deserializeProperty<P>(Object jsObj, String propertyName) {
    switch (propertyName) {
      case '\$id':
        return (IsarNative.jsObjectGet(jsObj, '\$id')) as P;
      case '\$type':
        return (IsarNative.jsObjectGet(jsObj, '\$type') ?? '') as P;
      case 'expiredAt':
        return (IsarNative.jsObjectGet(jsObj, 'expiredAt') != null
            ? DateTime.fromMillisecondsSinceEpoch(
                    IsarNative.jsObjectGet(jsObj, 'expiredAt'),
                    isUtc: true)
                .toLocal()
            : DateTime.fromMillisecondsSinceEpoch(0)) as P;
      case 'payload':
        return (IsarNative.jsObjectGet(jsObj, 'payload')) as P;
      case 'token':
        return (IsarNative.jsObjectGet(jsObj, 'token') ?? '') as P;
      default:
        throw 'Illegal propertyName';
    }
  }

  @override
  void attachLinks(Isar isar, int id, Authorization object) {}
}

class _AuthorizationNativeAdapter extends IsarNativeTypeAdapter<Authorization> {
  const _AuthorizationNativeAdapter();

  @override
  void serialize(
      IsarCollection<Authorization> collection,
      IsarRawObject rawObj,
      Authorization object,
      int staticSize,
      List<int> offsets,
      AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.$type;
    final _$type = IsarBinaryWriter.utf8Encoder.convert(value0);
    dynamicSize += (_$type.length) as int;
    final value1 = object.expiredAt;
    final _expiredAt = value1;
    final value2 = object.payload;
    IsarUint8List? _payload;
    if (value2 != null) {
      _payload = IsarBinaryWriter.utf8Encoder.convert(value2);
    }
    dynamicSize += (_payload?.length ?? 0) as int;
    final value3 = object.token;
    final _token = IsarBinaryWriter.utf8Encoder.convert(value3);
    dynamicSize += (_token.length) as int;
    final size = staticSize + dynamicSize;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
    final writer = IsarBinaryWriter(buffer, staticSize);
    writer.writeBytes(offsets[0], _$type);
    writer.writeDateTime(offsets[1], _expiredAt);
    writer.writeBytes(offsets[2], _payload);
    writer.writeBytes(offsets[3], _token);
  }

  @override
  Authorization deserialize(IsarCollection<Authorization> collection, int id,
      IsarBinaryReader reader, List<int> offsets) {
    final object = Authorization();
    object.$id = id;
    object.$type = reader.readString(offsets[0]);
    object.expiredAt = reader.readDateTime(offsets[1]);
    object.payload = reader.readStringOrNull(offsets[2]);
    object.token = reader.readString(offsets[3]);
    return object;
  }

  @override
  P deserializeProperty<P>(
      int id, IsarBinaryReader reader, int propertyIndex, int offset) {
    switch (propertyIndex) {
      case -1:
        return id as P;
      case 0:
        return (reader.readString(offset)) as P;
      case 1:
        return (reader.readDateTime(offset)) as P;
      case 2:
        return (reader.readStringOrNull(offset)) as P;
      case 3:
        return (reader.readString(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, Authorization object) {}
}

extension AuthorizationByIndex on IsarCollection<Authorization> {
  Future<Authorization?> getBy$type(String $type) {
    return getByIndex('\$type', [$type]);
  }

  Authorization? getBy$typeSync(String $type) {
    return getByIndexSync('\$type', [$type]);
  }

  Future<bool> deleteBy$type(String $type) {
    return deleteByIndex('\$type', [$type]);
  }

  bool deleteBy$typeSync(String $type) {
    return deleteByIndexSync('\$type', [$type]);
  }

  Future<List<Authorization?>> getAllBy$type(List<String> $typeValues) {
    final values = $typeValues.map((e) => [e]).toList();
    return getAllByIndex('\$type', values);
  }

  List<Authorization?> getAllBy$typeSync(List<String> $typeValues) {
    final values = $typeValues.map((e) => [e]).toList();
    return getAllByIndexSync('\$type', values);
  }

  Future<int> deleteAllBy$type(List<String> $typeValues) {
    final values = $typeValues.map((e) => [e]).toList();
    return deleteAllByIndex('\$type', values);
  }

  int deleteAllBy$typeSync(List<String> $typeValues) {
    final values = $typeValues.map((e) => [e]).toList();
    return deleteAllByIndexSync('\$type', values);
  }

  Future<Authorization?> getByToken(String token) {
    return getByIndex('token', [token]);
  }

  Authorization? getByTokenSync(String token) {
    return getByIndexSync('token', [token]);
  }

  Future<bool> deleteByToken(String token) {
    return deleteByIndex('token', [token]);
  }

  bool deleteByTokenSync(String token) {
    return deleteByIndexSync('token', [token]);
  }

  Future<List<Authorization?>> getAllByToken(List<String> tokenValues) {
    final values = tokenValues.map((e) => [e]).toList();
    return getAllByIndex('token', values);
  }

  List<Authorization?> getAllByTokenSync(List<String> tokenValues) {
    final values = tokenValues.map((e) => [e]).toList();
    return getAllByIndexSync('token', values);
  }

  Future<int> deleteAllByToken(List<String> tokenValues) {
    final values = tokenValues.map((e) => [e]).toList();
    return deleteAllByIndex('token', values);
  }

  int deleteAllByTokenSync(List<String> tokenValues) {
    final values = tokenValues.map((e) => [e]).toList();
    return deleteAllByIndexSync('token', values);
  }
}

extension AuthorizationQueryWhereSort
    on QueryBuilder<Authorization, Authorization, QWhere> {
  QueryBuilder<Authorization, Authorization, QAfterWhere> any$id() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }

  QueryBuilder<Authorization, Authorization, QAfterWhere> any$type() {
    return addWhereClauseInternal(const WhereClause(indexName: '\$type'));
  }

  QueryBuilder<Authorization, Authorization, QAfterWhere> anyToken() {
    return addWhereClauseInternal(const WhereClause(indexName: 'token'));
  }
}

extension AuthorizationQueryWhere
    on QueryBuilder<Authorization, Authorization, QWhereClause> {
  QueryBuilder<Authorization, Authorization, QAfterWhereClause> $idEqualTo(
      int? $id) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [$id],
      includeLower: true,
      upper: [$id],
      includeUpper: true,
    ));
  }

  QueryBuilder<Authorization, Authorization, QAfterWhereClause> $idNotEqualTo(
      int? $id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [$id],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [$id],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [$id],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [$id],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<Authorization, Authorization, QAfterWhereClause> $idGreaterThan(
    int? $id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [$id],
      includeLower: include,
    ));
  }

  QueryBuilder<Authorization, Authorization, QAfterWhereClause> $idLessThan(
    int? $id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [$id],
      includeUpper: include,
    ));
  }

  QueryBuilder<Authorization, Authorization, QAfterWhereClause> $idBetween(
    int? lower$id,
    int? upper$id, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [lower$id],
      includeLower: includeLower,
      upper: [upper$id],
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Authorization, Authorization, QAfterWhereClause> $typeEqualTo(
      String $type) {
    return addWhereClauseInternal(WhereClause(
      indexName: '\$type',
      lower: [$type],
      includeLower: true,
      upper: [$type],
      includeUpper: true,
    ));
  }

  QueryBuilder<Authorization, Authorization, QAfterWhereClause> $typeNotEqualTo(
      String $type) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: '\$type',
        upper: [$type],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: '\$type',
        lower: [$type],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: '\$type',
        lower: [$type],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: '\$type',
        upper: [$type],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<Authorization, Authorization, QAfterWhereClause> tokenEqualTo(
      String token) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'token',
      lower: [token],
      includeLower: true,
      upper: [token],
      includeUpper: true,
    ));
  }

  QueryBuilder<Authorization, Authorization, QAfterWhereClause> tokenNotEqualTo(
      String token) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: 'token',
        upper: [token],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'token',
        lower: [token],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: 'token',
        lower: [token],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'token',
        upper: [token],
        includeUpper: false,
      ));
    }
  }
}

extension AuthorizationQueryFilter
    on QueryBuilder<Authorization, Authorization, QFilterCondition> {
  QueryBuilder<Authorization, Authorization, QAfterFilterCondition>
      $idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: '\$id',
      value: null,
    ));
  }

  QueryBuilder<Authorization, Authorization, QAfterFilterCondition> $idEqualTo(
      int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: '\$id',
      value: value,
    ));
  }

  QueryBuilder<Authorization, Authorization, QAfterFilterCondition>
      $idGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: '\$id',
      value: value,
    ));
  }

  QueryBuilder<Authorization, Authorization, QAfterFilterCondition> $idLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: '\$id',
      value: value,
    ));
  }

  QueryBuilder<Authorization, Authorization, QAfterFilterCondition> $idBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: '\$id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Authorization, Authorization, QAfterFilterCondition>
      $typeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: '\$type',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Authorization, Authorization, QAfterFilterCondition>
      $typeGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: '\$type',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Authorization, Authorization, QAfterFilterCondition>
      $typeLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: '\$type',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Authorization, Authorization, QAfterFilterCondition>
      $typeBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: '\$type',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Authorization, Authorization, QAfterFilterCondition>
      $typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: '\$type',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Authorization, Authorization, QAfterFilterCondition>
      $typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: '\$type',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Authorization, Authorization, QAfterFilterCondition>
      $typeContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: '\$type',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Authorization, Authorization, QAfterFilterCondition>
      $typeMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: '\$type',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Authorization, Authorization, QAfterFilterCondition>
      expiredAtEqualTo(DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'expiredAt',
      value: value,
    ));
  }

  QueryBuilder<Authorization, Authorization, QAfterFilterCondition>
      expiredAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'expiredAt',
      value: value,
    ));
  }

  QueryBuilder<Authorization, Authorization, QAfterFilterCondition>
      expiredAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'expiredAt',
      value: value,
    ));
  }

  QueryBuilder<Authorization, Authorization, QAfterFilterCondition>
      expiredAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'expiredAt',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Authorization, Authorization, QAfterFilterCondition>
      payloadIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'payload',
      value: null,
    ));
  }

  QueryBuilder<Authorization, Authorization, QAfterFilterCondition>
      payloadEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'payload',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Authorization, Authorization, QAfterFilterCondition>
      payloadGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'payload',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Authorization, Authorization, QAfterFilterCondition>
      payloadLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'payload',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Authorization, Authorization, QAfterFilterCondition>
      payloadBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'payload',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Authorization, Authorization, QAfterFilterCondition>
      payloadStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'payload',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Authorization, Authorization, QAfterFilterCondition>
      payloadEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'payload',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Authorization, Authorization, QAfterFilterCondition>
      payloadContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'payload',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Authorization, Authorization, QAfterFilterCondition>
      payloadMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'payload',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Authorization, Authorization, QAfterFilterCondition>
      tokenEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'token',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Authorization, Authorization, QAfterFilterCondition>
      tokenGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'token',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Authorization, Authorization, QAfterFilterCondition>
      tokenLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'token',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Authorization, Authorization, QAfterFilterCondition>
      tokenBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'token',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Authorization, Authorization, QAfterFilterCondition>
      tokenStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'token',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Authorization, Authorization, QAfterFilterCondition>
      tokenEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'token',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Authorization, Authorization, QAfterFilterCondition>
      tokenContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'token',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Authorization, Authorization, QAfterFilterCondition>
      tokenMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'token',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension AuthorizationQueryLinks
    on QueryBuilder<Authorization, Authorization, QFilterCondition> {}

extension AuthorizationQueryWhereSortBy
    on QueryBuilder<Authorization, Authorization, QSortBy> {
  QueryBuilder<Authorization, Authorization, QAfterSortBy> sortBy$id() {
    return addSortByInternal('\$id', Sort.asc);
  }

  QueryBuilder<Authorization, Authorization, QAfterSortBy> sortBy$idDesc() {
    return addSortByInternal('\$id', Sort.desc);
  }

  QueryBuilder<Authorization, Authorization, QAfterSortBy> sortBy$type() {
    return addSortByInternal('\$type', Sort.asc);
  }

  QueryBuilder<Authorization, Authorization, QAfterSortBy> sortBy$typeDesc() {
    return addSortByInternal('\$type', Sort.desc);
  }

  QueryBuilder<Authorization, Authorization, QAfterSortBy> sortByExpiredAt() {
    return addSortByInternal('expiredAt', Sort.asc);
  }

  QueryBuilder<Authorization, Authorization, QAfterSortBy>
      sortByExpiredAtDesc() {
    return addSortByInternal('expiredAt', Sort.desc);
  }

  QueryBuilder<Authorization, Authorization, QAfterSortBy> sortByPayload() {
    return addSortByInternal('payload', Sort.asc);
  }

  QueryBuilder<Authorization, Authorization, QAfterSortBy> sortByPayloadDesc() {
    return addSortByInternal('payload', Sort.desc);
  }

  QueryBuilder<Authorization, Authorization, QAfterSortBy> sortByToken() {
    return addSortByInternal('token', Sort.asc);
  }

  QueryBuilder<Authorization, Authorization, QAfterSortBy> sortByTokenDesc() {
    return addSortByInternal('token', Sort.desc);
  }
}

extension AuthorizationQueryWhereSortThenBy
    on QueryBuilder<Authorization, Authorization, QSortThenBy> {
  QueryBuilder<Authorization, Authorization, QAfterSortBy> thenBy$id() {
    return addSortByInternal('\$id', Sort.asc);
  }

  QueryBuilder<Authorization, Authorization, QAfterSortBy> thenBy$idDesc() {
    return addSortByInternal('\$id', Sort.desc);
  }

  QueryBuilder<Authorization, Authorization, QAfterSortBy> thenBy$type() {
    return addSortByInternal('\$type', Sort.asc);
  }

  QueryBuilder<Authorization, Authorization, QAfterSortBy> thenBy$typeDesc() {
    return addSortByInternal('\$type', Sort.desc);
  }

  QueryBuilder<Authorization, Authorization, QAfterSortBy> thenByExpiredAt() {
    return addSortByInternal('expiredAt', Sort.asc);
  }

  QueryBuilder<Authorization, Authorization, QAfterSortBy>
      thenByExpiredAtDesc() {
    return addSortByInternal('expiredAt', Sort.desc);
  }

  QueryBuilder<Authorization, Authorization, QAfterSortBy> thenByPayload() {
    return addSortByInternal('payload', Sort.asc);
  }

  QueryBuilder<Authorization, Authorization, QAfterSortBy> thenByPayloadDesc() {
    return addSortByInternal('payload', Sort.desc);
  }

  QueryBuilder<Authorization, Authorization, QAfterSortBy> thenByToken() {
    return addSortByInternal('token', Sort.asc);
  }

  QueryBuilder<Authorization, Authorization, QAfterSortBy> thenByTokenDesc() {
    return addSortByInternal('token', Sort.desc);
  }
}

extension AuthorizationQueryWhereDistinct
    on QueryBuilder<Authorization, Authorization, QDistinct> {
  QueryBuilder<Authorization, Authorization, QDistinct> distinctBy$id() {
    return addDistinctByInternal('\$id');
  }

  QueryBuilder<Authorization, Authorization, QDistinct> distinctBy$type(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('\$type', caseSensitive: caseSensitive);
  }

  QueryBuilder<Authorization, Authorization, QDistinct> distinctByExpiredAt() {
    return addDistinctByInternal('expiredAt');
  }

  QueryBuilder<Authorization, Authorization, QDistinct> distinctByPayload(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('payload', caseSensitive: caseSensitive);
  }

  QueryBuilder<Authorization, Authorization, QDistinct> distinctByToken(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('token', caseSensitive: caseSensitive);
  }
}

extension AuthorizationQueryProperty
    on QueryBuilder<Authorization, Authorization, QQueryProperty> {
  QueryBuilder<Authorization, int?, QQueryOperations> $idProperty() {
    return addPropertyNameInternal('\$id');
  }

  QueryBuilder<Authorization, String, QQueryOperations> $typeProperty() {
    return addPropertyNameInternal('\$type');
  }

  QueryBuilder<Authorization, DateTime, QQueryOperations> expiredAtProperty() {
    return addPropertyNameInternal('expiredAt');
  }

  QueryBuilder<Authorization, String?, QQueryOperations> payloadProperty() {
    return addPropertyNameInternal('payload');
  }

  QueryBuilder<Authorization, String, QQueryOperations> tokenProperty() {
    return addPropertyNameInternal('token');
  }
}
