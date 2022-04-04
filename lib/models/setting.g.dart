// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetSettingCollection on Isar {
  IsarCollection<Setting> get settings {
    return getCollection('Setting');
  }
}

final SettingSchema = CollectionSchema(
  name: 'Setting',
  schema:
      '{"name":"Setting","idName":"\$id","properties":[{"name":"\$origin","type":"String"},{"name":"key","type":"String"}],"indexes":[{"name":"key","unique":true,"properties":[{"name":"key","type":"Hash","caseSensitive":true}]}],"links":[]}',
  nativeAdapter: const _SettingNativeAdapter(),
  webAdapter: const _SettingWebAdapter(),
  idName: '\$id',
  propertyIds: {'\$origin': 0, 'key': 1},
  listProperties: {},
  indexIds: {'key': 0},
  indexTypes: {
    'key': [
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

class _SettingWebAdapter extends IsarWebTypeAdapter<Setting> {
  const _SettingWebAdapter();

  @override
  Object serialize(IsarCollection<Setting> collection, Setting object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(jsObj, '\$id', object.$id);
    IsarNative.jsObjectSet(jsObj, '\$origin', object.$origin);
    IsarNative.jsObjectSet(jsObj, 'key', object.key);
    return jsObj;
  }

  @override
  Setting deserialize(IsarCollection<Setting> collection, dynamic jsObj) {
    final object = Setting();
    object.$id = IsarNative.jsObjectGet(jsObj, '\$id');
    object.$origin = IsarNative.jsObjectGet(jsObj, '\$origin') ?? '';
    object.key = IsarNative.jsObjectGet(jsObj, 'key') ?? '';
    return object;
  }

  @override
  P deserializeProperty<P>(Object jsObj, String propertyName) {
    switch (propertyName) {
      case '\$id':
        return (IsarNative.jsObjectGet(jsObj, '\$id')) as P;
      case '\$origin':
        return (IsarNative.jsObjectGet(jsObj, '\$origin') ?? '') as P;
      case 'key':
        return (IsarNative.jsObjectGet(jsObj, 'key') ?? '') as P;
      default:
        throw 'Illegal propertyName';
    }
  }

  @override
  void attachLinks(Isar isar, int id, Setting object) {}
}

class _SettingNativeAdapter extends IsarNativeTypeAdapter<Setting> {
  const _SettingNativeAdapter();

  @override
  void serialize(IsarCollection<Setting> collection, IsarRawObject rawObj,
      Setting object, int staticSize, List<int> offsets, AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.$origin;
    final _$origin = IsarBinaryWriter.utf8Encoder.convert(value0);
    dynamicSize += (_$origin.length) as int;
    final value1 = object.key;
    final _key = IsarBinaryWriter.utf8Encoder.convert(value1);
    dynamicSize += (_key.length) as int;
    final size = staticSize + dynamicSize;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
    final writer = IsarBinaryWriter(buffer, staticSize);
    writer.writeBytes(offsets[0], _$origin);
    writer.writeBytes(offsets[1], _key);
  }

  @override
  Setting deserialize(IsarCollection<Setting> collection, int id,
      IsarBinaryReader reader, List<int> offsets) {
    final object = Setting();
    object.$id = id;
    object.$origin = reader.readString(offsets[0]);
    object.key = reader.readString(offsets[1]);
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
        return (reader.readString(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, Setting object) {}
}

extension SettingByIndex on IsarCollection<Setting> {
  Future<Setting?> getByKey(String key) {
    return getByIndex('key', [key]);
  }

  Setting? getByKeySync(String key) {
    return getByIndexSync('key', [key]);
  }

  Future<bool> deleteByKey(String key) {
    return deleteByIndex('key', [key]);
  }

  bool deleteByKeySync(String key) {
    return deleteByIndexSync('key', [key]);
  }

  Future<List<Setting?>> getAllByKey(List<String> keyValues) {
    final values = keyValues.map((e) => [e]).toList();
    return getAllByIndex('key', values);
  }

  List<Setting?> getAllByKeySync(List<String> keyValues) {
    final values = keyValues.map((e) => [e]).toList();
    return getAllByIndexSync('key', values);
  }

  Future<int> deleteAllByKey(List<String> keyValues) {
    final values = keyValues.map((e) => [e]).toList();
    return deleteAllByIndex('key', values);
  }

  int deleteAllByKeySync(List<String> keyValues) {
    final values = keyValues.map((e) => [e]).toList();
    return deleteAllByIndexSync('key', values);
  }
}

extension SettingQueryWhereSort on QueryBuilder<Setting, Setting, QWhere> {
  QueryBuilder<Setting, Setting, QAfterWhere> any$id() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }

  QueryBuilder<Setting, Setting, QAfterWhere> anyKey() {
    return addWhereClauseInternal(const WhereClause(indexName: 'key'));
  }
}

extension SettingQueryWhere on QueryBuilder<Setting, Setting, QWhereClause> {
  QueryBuilder<Setting, Setting, QAfterWhereClause> $idEqualTo(int? $id) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [$id],
      includeLower: true,
      upper: [$id],
      includeUpper: true,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterWhereClause> $idNotEqualTo(int? $id) {
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

  QueryBuilder<Setting, Setting, QAfterWhereClause> $idGreaterThan(
    int? $id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [$id],
      includeLower: include,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterWhereClause> $idLessThan(
    int? $id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [$id],
      includeUpper: include,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterWhereClause> $idBetween(
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

  QueryBuilder<Setting, Setting, QAfterWhereClause> keyEqualTo(String key) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'key',
      lower: [key],
      includeLower: true,
      upper: [key],
      includeUpper: true,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterWhereClause> keyNotEqualTo(String key) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: 'key',
        upper: [key],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'key',
        lower: [key],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: 'key',
        lower: [key],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'key',
        upper: [key],
        includeUpper: false,
      ));
    }
  }
}

extension SettingQueryFilter
    on QueryBuilder<Setting, Setting, QFilterCondition> {
  QueryBuilder<Setting, Setting, QAfterFilterCondition> $idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: '\$id',
      value: null,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> $idEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: '\$id',
      value: value,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> $idGreaterThan(
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

  QueryBuilder<Setting, Setting, QAfterFilterCondition> $idLessThan(
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

  QueryBuilder<Setting, Setting, QAfterFilterCondition> $idBetween(
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

  QueryBuilder<Setting, Setting, QAfterFilterCondition> $originEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: '\$origin',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> $originGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: '\$origin',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> $originLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: '\$origin',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> $originBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: '\$origin',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> $originStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: '\$origin',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> $originEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: '\$origin',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> $originContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: '\$origin',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> $originMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: '\$origin',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> keyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> keyGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> keyLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> keyBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'key',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> keyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> keyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> keyContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Setting, Setting, QAfterFilterCondition> keyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'key',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension SettingQueryLinks
    on QueryBuilder<Setting, Setting, QFilterCondition> {}

extension SettingQueryWhereSortBy on QueryBuilder<Setting, Setting, QSortBy> {
  QueryBuilder<Setting, Setting, QAfterSortBy> sortBy$id() {
    return addSortByInternal('\$id', Sort.asc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> sortBy$idDesc() {
    return addSortByInternal('\$id', Sort.desc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> sortBy$origin() {
    return addSortByInternal('\$origin', Sort.asc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> sortBy$originDesc() {
    return addSortByInternal('\$origin', Sort.desc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> sortByKey() {
    return addSortByInternal('key', Sort.asc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> sortByKeyDesc() {
    return addSortByInternal('key', Sort.desc);
  }
}

extension SettingQueryWhereSortThenBy
    on QueryBuilder<Setting, Setting, QSortThenBy> {
  QueryBuilder<Setting, Setting, QAfterSortBy> thenBy$id() {
    return addSortByInternal('\$id', Sort.asc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> thenBy$idDesc() {
    return addSortByInternal('\$id', Sort.desc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> thenBy$origin() {
    return addSortByInternal('\$origin', Sort.asc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> thenBy$originDesc() {
    return addSortByInternal('\$origin', Sort.desc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> thenByKey() {
    return addSortByInternal('key', Sort.asc);
  }

  QueryBuilder<Setting, Setting, QAfterSortBy> thenByKeyDesc() {
    return addSortByInternal('key', Sort.desc);
  }
}

extension SettingQueryWhereDistinct
    on QueryBuilder<Setting, Setting, QDistinct> {
  QueryBuilder<Setting, Setting, QDistinct> distinctBy$id() {
    return addDistinctByInternal('\$id');
  }

  QueryBuilder<Setting, Setting, QDistinct> distinctBy$origin(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('\$origin', caseSensitive: caseSensitive);
  }

  QueryBuilder<Setting, Setting, QDistinct> distinctByKey(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('key', caseSensitive: caseSensitive);
  }
}

extension SettingQueryProperty
    on QueryBuilder<Setting, Setting, QQueryProperty> {
  QueryBuilder<Setting, int?, QQueryOperations> $idProperty() {
    return addPropertyNameInternal('\$id');
  }

  QueryBuilder<Setting, String, QQueryOperations> $originProperty() {
    return addPropertyNameInternal('\$origin');
  }

  QueryBuilder<Setting, String, QQueryOperations> keyProperty() {
    return addPropertyNameInternal('key');
  }
}
