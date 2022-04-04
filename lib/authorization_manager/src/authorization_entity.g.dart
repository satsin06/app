// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorization_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetAuthorizationEntityCollection on Isar {
  IsarCollection<AuthorizationEntity> get authorizationEntitys {
    return getCollection('AuthorizationEntity');
  }
}

final AuthorizationEntitySchema = CollectionSchema(
  name: 'AuthorizationEntity',
  schema:
      '{"name":"AuthorizationEntity","idName":"\$id","properties":[{"name":"expiredAt","type":"Long"},{"name":"isRefreshToken","type":"Bool"},{"name":"payload","type":"String"},{"name":"token","type":"String"}],"indexes":[{"name":"isRefreshToken","unique":true,"properties":[{"name":"isRefreshToken","type":"Value","caseSensitive":false}]}],"links":[]}',
  nativeAdapter: const _AuthorizationEntityNativeAdapter(),
  webAdapter: const _AuthorizationEntityWebAdapter(),
  idName: '\$id',
  propertyIds: {'expiredAt': 0, 'isRefreshToken': 1, 'payload': 2, 'token': 3},
  listProperties: {},
  indexIds: {'isRefreshToken': 0},
  indexTypes: {
    'isRefreshToken': [
      NativeIndexType.bool,
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

class _AuthorizationEntityWebAdapter
    extends IsarWebTypeAdapter<AuthorizationEntity> {
  const _AuthorizationEntityWebAdapter();

  @override
  Object serialize(IsarCollection<AuthorizationEntity> collection,
      AuthorizationEntity object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(jsObj, '\$id', object.$id);
    IsarNative.jsObjectSet(
        jsObj, 'expiredAt', object.expiredAt.toUtc().millisecondsSinceEpoch);
    IsarNative.jsObjectSet(jsObj, 'isRefreshToken', object.isRefreshToken);
    IsarNative.jsObjectSet(jsObj, 'payload', object.payload);
    IsarNative.jsObjectSet(jsObj, 'token', object.token);
    return jsObj;
  }

  @override
  AuthorizationEntity deserialize(
      IsarCollection<AuthorizationEntity> collection, dynamic jsObj) {
    final object = AuthorizationEntity();
    object.$id = IsarNative.jsObjectGet(jsObj, '\$id');
    object.expiredAt = IsarNative.jsObjectGet(jsObj, 'expiredAt') != null
        ? DateTime.fromMillisecondsSinceEpoch(
                IsarNative.jsObjectGet(jsObj, 'expiredAt'),
                isUtc: true)
            .toLocal()
        : DateTime.fromMillisecondsSinceEpoch(0);
    object.isRefreshToken =
        IsarNative.jsObjectGet(jsObj, 'isRefreshToken') ?? false;
    object.payload = IsarNative.jsObjectGet(jsObj, 'payload');
    object.token = IsarNative.jsObjectGet(jsObj, 'token') ?? '';
    return object;
  }

  @override
  P deserializeProperty<P>(Object jsObj, String propertyName) {
    switch (propertyName) {
      case '\$id':
        return (IsarNative.jsObjectGet(jsObj, '\$id')) as P;
      case 'expiredAt':
        return (IsarNative.jsObjectGet(jsObj, 'expiredAt') != null
            ? DateTime.fromMillisecondsSinceEpoch(
                    IsarNative.jsObjectGet(jsObj, 'expiredAt'),
                    isUtc: true)
                .toLocal()
            : DateTime.fromMillisecondsSinceEpoch(0)) as P;
      case 'isRefreshToken':
        return (IsarNative.jsObjectGet(jsObj, 'isRefreshToken') ?? false) as P;
      case 'payload':
        return (IsarNative.jsObjectGet(jsObj, 'payload')) as P;
      case 'token':
        return (IsarNative.jsObjectGet(jsObj, 'token') ?? '') as P;
      default:
        throw 'Illegal propertyName';
    }
  }

  @override
  void attachLinks(Isar isar, int id, AuthorizationEntity object) {}
}

class _AuthorizationEntityNativeAdapter
    extends IsarNativeTypeAdapter<AuthorizationEntity> {
  const _AuthorizationEntityNativeAdapter();

  @override
  void serialize(
      IsarCollection<AuthorizationEntity> collection,
      IsarRawObject rawObj,
      AuthorizationEntity object,
      int staticSize,
      List<int> offsets,
      AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.expiredAt;
    final _expiredAt = value0;
    final value1 = object.isRefreshToken;
    final _isRefreshToken = value1;
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
    writer.writeDateTime(offsets[0], _expiredAt);
    writer.writeBool(offsets[1], _isRefreshToken);
    writer.writeBytes(offsets[2], _payload);
    writer.writeBytes(offsets[3], _token);
  }

  @override
  AuthorizationEntity deserialize(
      IsarCollection<AuthorizationEntity> collection,
      int id,
      IsarBinaryReader reader,
      List<int> offsets) {
    final object = AuthorizationEntity();
    object.$id = id;
    object.expiredAt = reader.readDateTime(offsets[0]);
    object.isRefreshToken = reader.readBool(offsets[1]);
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
        return (reader.readDateTime(offset)) as P;
      case 1:
        return (reader.readBool(offset)) as P;
      case 2:
        return (reader.readStringOrNull(offset)) as P;
      case 3:
        return (reader.readString(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, AuthorizationEntity object) {}
}

extension AuthorizationEntityByIndex on IsarCollection<AuthorizationEntity> {
  Future<AuthorizationEntity?> getByIsRefreshToken(bool isRefreshToken) {
    return getByIndex('isRefreshToken', [isRefreshToken]);
  }

  AuthorizationEntity? getByIsRefreshTokenSync(bool isRefreshToken) {
    return getByIndexSync('isRefreshToken', [isRefreshToken]);
  }

  Future<bool> deleteByIsRefreshToken(bool isRefreshToken) {
    return deleteByIndex('isRefreshToken', [isRefreshToken]);
  }

  bool deleteByIsRefreshTokenSync(bool isRefreshToken) {
    return deleteByIndexSync('isRefreshToken', [isRefreshToken]);
  }

  Future<List<AuthorizationEntity?>> getAllByIsRefreshToken(
      List<bool> isRefreshTokenValues) {
    final values = isRefreshTokenValues.map((e) => [e]).toList();
    return getAllByIndex('isRefreshToken', values);
  }

  List<AuthorizationEntity?> getAllByIsRefreshTokenSync(
      List<bool> isRefreshTokenValues) {
    final values = isRefreshTokenValues.map((e) => [e]).toList();
    return getAllByIndexSync('isRefreshToken', values);
  }

  Future<int> deleteAllByIsRefreshToken(List<bool> isRefreshTokenValues) {
    final values = isRefreshTokenValues.map((e) => [e]).toList();
    return deleteAllByIndex('isRefreshToken', values);
  }

  int deleteAllByIsRefreshTokenSync(List<bool> isRefreshTokenValues) {
    final values = isRefreshTokenValues.map((e) => [e]).toList();
    return deleteAllByIndexSync('isRefreshToken', values);
  }
}

extension AuthorizationEntityQueryWhereSort
    on QueryBuilder<AuthorizationEntity, AuthorizationEntity, QWhere> {
  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterWhere> any$id() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterWhere>
      anyIsRefreshToken() {
    return addWhereClauseInternal(
        const WhereClause(indexName: 'isRefreshToken'));
  }
}

extension AuthorizationEntityQueryWhere
    on QueryBuilder<AuthorizationEntity, AuthorizationEntity, QWhereClause> {
  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterWhereClause>
      $idEqualTo(int? $id) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [$id],
      includeLower: true,
      upper: [$id],
      includeUpper: true,
    ));
  }

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterWhereClause>
      $idNotEqualTo(int? $id) {
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

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterWhereClause>
      $idGreaterThan(
    int? $id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [$id],
      includeLower: include,
    ));
  }

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterWhereClause>
      $idLessThan(
    int? $id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [$id],
      includeUpper: include,
    ));
  }

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterWhereClause>
      $idBetween(
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

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterWhereClause>
      isRefreshTokenEqualTo(bool isRefreshToken) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'isRefreshToken',
      lower: [isRefreshToken],
      includeLower: true,
      upper: [isRefreshToken],
      includeUpper: true,
    ));
  }

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterWhereClause>
      isRefreshTokenNotEqualTo(bool isRefreshToken) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: 'isRefreshToken',
        upper: [isRefreshToken],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'isRefreshToken',
        lower: [isRefreshToken],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: 'isRefreshToken',
        lower: [isRefreshToken],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'isRefreshToken',
        upper: [isRefreshToken],
        includeUpper: false,
      ));
    }
  }
}

extension AuthorizationEntityQueryFilter on QueryBuilder<AuthorizationEntity,
    AuthorizationEntity, QFilterCondition> {
  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterFilterCondition>
      $idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: '\$id',
      value: null,
    ));
  }

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterFilterCondition>
      $idEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: '\$id',
      value: value,
    ));
  }

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterFilterCondition>
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

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterFilterCondition>
      $idLessThan(
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

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterFilterCondition>
      $idBetween(
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

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterFilterCondition>
      expiredAtEqualTo(DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'expiredAt',
      value: value,
    ));
  }

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterFilterCondition>
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

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterFilterCondition>
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

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterFilterCondition>
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

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterFilterCondition>
      isRefreshTokenEqualTo(bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'isRefreshToken',
      value: value,
    ));
  }

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterFilterCondition>
      payloadIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'payload',
      value: null,
    ));
  }

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterFilterCondition>
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

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterFilterCondition>
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

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterFilterCondition>
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

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterFilterCondition>
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

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterFilterCondition>
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

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterFilterCondition>
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

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterFilterCondition>
      payloadContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'payload',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterFilterCondition>
      payloadMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'payload',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterFilterCondition>
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

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterFilterCondition>
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

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterFilterCondition>
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

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterFilterCondition>
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

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterFilterCondition>
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

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterFilterCondition>
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

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterFilterCondition>
      tokenContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'token',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterFilterCondition>
      tokenMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'token',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension AuthorizationEntityQueryLinks on QueryBuilder<AuthorizationEntity,
    AuthorizationEntity, QFilterCondition> {}

extension AuthorizationEntityQueryWhereSortBy
    on QueryBuilder<AuthorizationEntity, AuthorizationEntity, QSortBy> {
  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterSortBy>
      sortBy$id() {
    return addSortByInternal('\$id', Sort.asc);
  }

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterSortBy>
      sortBy$idDesc() {
    return addSortByInternal('\$id', Sort.desc);
  }

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterSortBy>
      sortByExpiredAt() {
    return addSortByInternal('expiredAt', Sort.asc);
  }

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterSortBy>
      sortByExpiredAtDesc() {
    return addSortByInternal('expiredAt', Sort.desc);
  }

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterSortBy>
      sortByIsRefreshToken() {
    return addSortByInternal('isRefreshToken', Sort.asc);
  }

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterSortBy>
      sortByIsRefreshTokenDesc() {
    return addSortByInternal('isRefreshToken', Sort.desc);
  }

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterSortBy>
      sortByPayload() {
    return addSortByInternal('payload', Sort.asc);
  }

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterSortBy>
      sortByPayloadDesc() {
    return addSortByInternal('payload', Sort.desc);
  }

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterSortBy>
      sortByToken() {
    return addSortByInternal('token', Sort.asc);
  }

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterSortBy>
      sortByTokenDesc() {
    return addSortByInternal('token', Sort.desc);
  }
}

extension AuthorizationEntityQueryWhereSortThenBy
    on QueryBuilder<AuthorizationEntity, AuthorizationEntity, QSortThenBy> {
  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterSortBy>
      thenBy$id() {
    return addSortByInternal('\$id', Sort.asc);
  }

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterSortBy>
      thenBy$idDesc() {
    return addSortByInternal('\$id', Sort.desc);
  }

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterSortBy>
      thenByExpiredAt() {
    return addSortByInternal('expiredAt', Sort.asc);
  }

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterSortBy>
      thenByExpiredAtDesc() {
    return addSortByInternal('expiredAt', Sort.desc);
  }

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterSortBy>
      thenByIsRefreshToken() {
    return addSortByInternal('isRefreshToken', Sort.asc);
  }

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterSortBy>
      thenByIsRefreshTokenDesc() {
    return addSortByInternal('isRefreshToken', Sort.desc);
  }

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterSortBy>
      thenByPayload() {
    return addSortByInternal('payload', Sort.asc);
  }

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterSortBy>
      thenByPayloadDesc() {
    return addSortByInternal('payload', Sort.desc);
  }

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterSortBy>
      thenByToken() {
    return addSortByInternal('token', Sort.asc);
  }

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QAfterSortBy>
      thenByTokenDesc() {
    return addSortByInternal('token', Sort.desc);
  }
}

extension AuthorizationEntityQueryWhereDistinct
    on QueryBuilder<AuthorizationEntity, AuthorizationEntity, QDistinct> {
  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QDistinct>
      distinctBy$id() {
    return addDistinctByInternal('\$id');
  }

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QDistinct>
      distinctByExpiredAt() {
    return addDistinctByInternal('expiredAt');
  }

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QDistinct>
      distinctByIsRefreshToken() {
    return addDistinctByInternal('isRefreshToken');
  }

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QDistinct>
      distinctByPayload({bool caseSensitive = true}) {
    return addDistinctByInternal('payload', caseSensitive: caseSensitive);
  }

  QueryBuilder<AuthorizationEntity, AuthorizationEntity, QDistinct>
      distinctByToken({bool caseSensitive = true}) {
    return addDistinctByInternal('token', caseSensitive: caseSensitive);
  }
}

extension AuthorizationEntityQueryProperty
    on QueryBuilder<AuthorizationEntity, AuthorizationEntity, QQueryProperty> {
  QueryBuilder<AuthorizationEntity, int?, QQueryOperations> $idProperty() {
    return addPropertyNameInternal('\$id');
  }

  QueryBuilder<AuthorizationEntity, DateTime, QQueryOperations>
      expiredAtProperty() {
    return addPropertyNameInternal('expiredAt');
  }

  QueryBuilder<AuthorizationEntity, bool, QQueryOperations>
      isRefreshTokenProperty() {
    return addPropertyNameInternal('isRefreshToken');
  }

  QueryBuilder<AuthorizationEntity, String?, QQueryOperations>
      payloadProperty() {
    return addPropertyNameInternal('payload');
  }

  QueryBuilder<AuthorizationEntity, String, QQueryOperations> tokenProperty() {
    return addPropertyNameInternal('token');
  }
}
