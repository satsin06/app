// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetUserCollection on Isar {
  IsarCollection<User> get users {
    return getCollection('User');
  }
}

final UserSchema = CollectionSchema(
  name: 'User',
  schema:
      '{"name":"User","idName":"\$storeId","properties":[{"name":"email","type":"String"},{"name":"id","type":"String"},{"name":"phone","type":"String"},{"name":"username","type":"String"}],"indexes":[{"name":"email","unique":true,"properties":[{"name":"email","type":"Hash","caseSensitive":true}]},{"name":"id","unique":true,"properties":[{"name":"id","type":"Hash","caseSensitive":true}]},{"name":"phone","unique":true,"properties":[{"name":"phone","type":"Hash","caseSensitive":true}]},{"name":"username","unique":true,"properties":[{"name":"username","type":"Hash","caseSensitive":true}]}],"links":[]}',
  nativeAdapter: const _UserNativeAdapter(),
  webAdapter: const _UserWebAdapter(),
  idName: '\$storeId',
  propertyIds: {'email': 0, 'id': 1, 'phone': 2, 'username': 3},
  listProperties: {},
  indexIds: {'email': 0, 'id': 1, 'phone': 2, 'username': 3},
  indexTypes: {
    'email': [
      NativeIndexType.stringHash,
    ],
    'id': [
      NativeIndexType.stringHash,
    ],
    'phone': [
      NativeIndexType.stringHash,
    ],
    'username': [
      NativeIndexType.stringHash,
    ]
  },
  linkIds: {},
  backlinkIds: {},
  linkedCollections: [],
  getId: (obj) {
    if (obj.$storeId == Isar.autoIncrement) {
      return null;
    } else {
      return obj.$storeId;
    }
  },
  setId: (obj, id) => obj.$storeId = id,
  getLinks: (obj) => [],
  version: 2,
);

class _UserWebAdapter extends IsarWebTypeAdapter<User> {
  const _UserWebAdapter();

  @override
  Object serialize(IsarCollection<User> collection, User object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(jsObj, '\$storeId', object.$storeId);
    IsarNative.jsObjectSet(jsObj, 'email', object.email);
    IsarNative.jsObjectSet(jsObj, 'id', object.id);
    IsarNative.jsObjectSet(jsObj, 'phone', object.phone);
    IsarNative.jsObjectSet(jsObj, 'username', object.username);
    return jsObj;
  }

  @override
  User deserialize(IsarCollection<User> collection, dynamic jsObj) {
    final object = User();
    object.$storeId = IsarNative.jsObjectGet(jsObj, '\$storeId');
    object.email = IsarNative.jsObjectGet(jsObj, 'email');
    object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? '';
    object.phone = IsarNative.jsObjectGet(jsObj, 'phone');
    object.username = IsarNative.jsObjectGet(jsObj, 'username');
    return object;
  }

  @override
  P deserializeProperty<P>(Object jsObj, String propertyName) {
    switch (propertyName) {
      case '\$storeId':
        return (IsarNative.jsObjectGet(jsObj, '\$storeId')) as P;
      case 'email':
        return (IsarNative.jsObjectGet(jsObj, 'email')) as P;
      case 'id':
        return (IsarNative.jsObjectGet(jsObj, 'id') ?? '') as P;
      case 'phone':
        return (IsarNative.jsObjectGet(jsObj, 'phone')) as P;
      case 'username':
        return (IsarNative.jsObjectGet(jsObj, 'username')) as P;
      default:
        throw 'Illegal propertyName';
    }
  }

  @override
  void attachLinks(Isar isar, int id, User object) {}
}

class _UserNativeAdapter extends IsarNativeTypeAdapter<User> {
  const _UserNativeAdapter();

  @override
  void serialize(IsarCollection<User> collection, IsarRawObject rawObj,
      User object, int staticSize, List<int> offsets, AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.email;
    IsarUint8List? _email;
    if (value0 != null) {
      _email = IsarBinaryWriter.utf8Encoder.convert(value0);
    }
    dynamicSize += (_email?.length ?? 0) as int;
    final value1 = object.id;
    final _id = IsarBinaryWriter.utf8Encoder.convert(value1);
    dynamicSize += (_id.length) as int;
    final value2 = object.phone;
    IsarUint8List? _phone;
    if (value2 != null) {
      _phone = IsarBinaryWriter.utf8Encoder.convert(value2);
    }
    dynamicSize += (_phone?.length ?? 0) as int;
    final value3 = object.username;
    IsarUint8List? _username;
    if (value3 != null) {
      _username = IsarBinaryWriter.utf8Encoder.convert(value3);
    }
    dynamicSize += (_username?.length ?? 0) as int;
    final size = staticSize + dynamicSize;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
    final writer = IsarBinaryWriter(buffer, staticSize);
    writer.writeBytes(offsets[0], _email);
    writer.writeBytes(offsets[1], _id);
    writer.writeBytes(offsets[2], _phone);
    writer.writeBytes(offsets[3], _username);
  }

  @override
  User deserialize(IsarCollection<User> collection, int id,
      IsarBinaryReader reader, List<int> offsets) {
    final object = User();
    object.$storeId = id;
    object.email = reader.readStringOrNull(offsets[0]);
    object.id = reader.readString(offsets[1]);
    object.phone = reader.readStringOrNull(offsets[2]);
    object.username = reader.readStringOrNull(offsets[3]);
    return object;
  }

  @override
  P deserializeProperty<P>(
      int id, IsarBinaryReader reader, int propertyIndex, int offset) {
    switch (propertyIndex) {
      case -1:
        return id as P;
      case 0:
        return (reader.readStringOrNull(offset)) as P;
      case 1:
        return (reader.readString(offset)) as P;
      case 2:
        return (reader.readStringOrNull(offset)) as P;
      case 3:
        return (reader.readStringOrNull(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, User object) {}
}

extension UserByIndex on IsarCollection<User> {
  Future<User?> getByEmail(String? email) {
    return getByIndex('email', [email]);
  }

  User? getByEmailSync(String? email) {
    return getByIndexSync('email', [email]);
  }

  Future<bool> deleteByEmail(String? email) {
    return deleteByIndex('email', [email]);
  }

  bool deleteByEmailSync(String? email) {
    return deleteByIndexSync('email', [email]);
  }

  Future<List<User?>> getAllByEmail(List<String?> emailValues) {
    final values = emailValues.map((e) => [e]).toList();
    return getAllByIndex('email', values);
  }

  List<User?> getAllByEmailSync(List<String?> emailValues) {
    final values = emailValues.map((e) => [e]).toList();
    return getAllByIndexSync('email', values);
  }

  Future<int> deleteAllByEmail(List<String?> emailValues) {
    final values = emailValues.map((e) => [e]).toList();
    return deleteAllByIndex('email', values);
  }

  int deleteAllByEmailSync(List<String?> emailValues) {
    final values = emailValues.map((e) => [e]).toList();
    return deleteAllByIndexSync('email', values);
  }

  Future<User?> getById(String id) {
    return getByIndex('id', [id]);
  }

  User? getByIdSync(String id) {
    return getByIndexSync('id', [id]);
  }

  Future<bool> deleteById(String id) {
    return deleteByIndex('id', [id]);
  }

  bool deleteByIdSync(String id) {
    return deleteByIndexSync('id', [id]);
  }

  Future<List<User?>> getAllById(List<String> idValues) {
    final values = idValues.map((e) => [e]).toList();
    return getAllByIndex('id', values);
  }

  List<User?> getAllByIdSync(List<String> idValues) {
    final values = idValues.map((e) => [e]).toList();
    return getAllByIndexSync('id', values);
  }

  Future<int> deleteAllById(List<String> idValues) {
    final values = idValues.map((e) => [e]).toList();
    return deleteAllByIndex('id', values);
  }

  int deleteAllByIdSync(List<String> idValues) {
    final values = idValues.map((e) => [e]).toList();
    return deleteAllByIndexSync('id', values);
  }

  Future<User?> getByPhone(String? phone) {
    return getByIndex('phone', [phone]);
  }

  User? getByPhoneSync(String? phone) {
    return getByIndexSync('phone', [phone]);
  }

  Future<bool> deleteByPhone(String? phone) {
    return deleteByIndex('phone', [phone]);
  }

  bool deleteByPhoneSync(String? phone) {
    return deleteByIndexSync('phone', [phone]);
  }

  Future<List<User?>> getAllByPhone(List<String?> phoneValues) {
    final values = phoneValues.map((e) => [e]).toList();
    return getAllByIndex('phone', values);
  }

  List<User?> getAllByPhoneSync(List<String?> phoneValues) {
    final values = phoneValues.map((e) => [e]).toList();
    return getAllByIndexSync('phone', values);
  }

  Future<int> deleteAllByPhone(List<String?> phoneValues) {
    final values = phoneValues.map((e) => [e]).toList();
    return deleteAllByIndex('phone', values);
  }

  int deleteAllByPhoneSync(List<String?> phoneValues) {
    final values = phoneValues.map((e) => [e]).toList();
    return deleteAllByIndexSync('phone', values);
  }

  Future<User?> getByUsername(String? username) {
    return getByIndex('username', [username]);
  }

  User? getByUsernameSync(String? username) {
    return getByIndexSync('username', [username]);
  }

  Future<bool> deleteByUsername(String? username) {
    return deleteByIndex('username', [username]);
  }

  bool deleteByUsernameSync(String? username) {
    return deleteByIndexSync('username', [username]);
  }

  Future<List<User?>> getAllByUsername(List<String?> usernameValues) {
    final values = usernameValues.map((e) => [e]).toList();
    return getAllByIndex('username', values);
  }

  List<User?> getAllByUsernameSync(List<String?> usernameValues) {
    final values = usernameValues.map((e) => [e]).toList();
    return getAllByIndexSync('username', values);
  }

  Future<int> deleteAllByUsername(List<String?> usernameValues) {
    final values = usernameValues.map((e) => [e]).toList();
    return deleteAllByIndex('username', values);
  }

  int deleteAllByUsernameSync(List<String?> usernameValues) {
    final values = usernameValues.map((e) => [e]).toList();
    return deleteAllByIndexSync('username', values);
  }
}

extension UserQueryWhereSort on QueryBuilder<User, User, QWhere> {
  QueryBuilder<User, User, QAfterWhere> any$storeId() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }

  QueryBuilder<User, User, QAfterWhere> anyEmail() {
    return addWhereClauseInternal(const WhereClause(indexName: 'email'));
  }

  QueryBuilder<User, User, QAfterWhere> anyId() {
    return addWhereClauseInternal(const WhereClause(indexName: 'id'));
  }

  QueryBuilder<User, User, QAfterWhere> anyPhone() {
    return addWhereClauseInternal(const WhereClause(indexName: 'phone'));
  }

  QueryBuilder<User, User, QAfterWhere> anyUsername() {
    return addWhereClauseInternal(const WhereClause(indexName: 'username'));
  }
}

extension UserQueryWhere on QueryBuilder<User, User, QWhereClause> {
  QueryBuilder<User, User, QAfterWhereClause> $storeIdEqualTo(int? $storeId) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [$storeId],
      includeLower: true,
      upper: [$storeId],
      includeUpper: true,
    ));
  }

  QueryBuilder<User, User, QAfterWhereClause> $storeIdNotEqualTo(
      int? $storeId) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [$storeId],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [$storeId],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [$storeId],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [$storeId],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<User, User, QAfterWhereClause> $storeIdGreaterThan(
    int? $storeId, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [$storeId],
      includeLower: include,
    ));
  }

  QueryBuilder<User, User, QAfterWhereClause> $storeIdLessThan(
    int? $storeId, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [$storeId],
      includeUpper: include,
    ));
  }

  QueryBuilder<User, User, QAfterWhereClause> $storeIdBetween(
    int? lower$storeId,
    int? upper$storeId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [lower$storeId],
      includeLower: includeLower,
      upper: [upper$storeId],
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<User, User, QAfterWhereClause> emailEqualTo(String? email) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'email',
      lower: [email],
      includeLower: true,
      upper: [email],
      includeUpper: true,
    ));
  }

  QueryBuilder<User, User, QAfterWhereClause> emailNotEqualTo(String? email) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: 'email',
        upper: [email],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'email',
        lower: [email],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: 'email',
        lower: [email],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'email',
        upper: [email],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<User, User, QAfterWhereClause> emailIsNull() {
    return addWhereClauseInternal(const WhereClause(
      indexName: 'email',
      upper: [null],
      includeUpper: true,
      lower: [null],
      includeLower: true,
    ));
  }

  QueryBuilder<User, User, QAfterWhereClause> emailIsNotNull() {
    return addWhereClauseInternal(const WhereClause(
      indexName: 'email',
      lower: [null],
      includeLower: false,
    ));
  }

  QueryBuilder<User, User, QAfterWhereClause> idEqualTo(String id) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'id',
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<User, User, QAfterWhereClause> idNotEqualTo(String id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: 'id',
        upper: [id],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'id',
        lower: [id],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: 'id',
        lower: [id],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'id',
        upper: [id],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<User, User, QAfterWhereClause> phoneEqualTo(String? phone) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'phone',
      lower: [phone],
      includeLower: true,
      upper: [phone],
      includeUpper: true,
    ));
  }

  QueryBuilder<User, User, QAfterWhereClause> phoneNotEqualTo(String? phone) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: 'phone',
        upper: [phone],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'phone',
        lower: [phone],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: 'phone',
        lower: [phone],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'phone',
        upper: [phone],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<User, User, QAfterWhereClause> phoneIsNull() {
    return addWhereClauseInternal(const WhereClause(
      indexName: 'phone',
      upper: [null],
      includeUpper: true,
      lower: [null],
      includeLower: true,
    ));
  }

  QueryBuilder<User, User, QAfterWhereClause> phoneIsNotNull() {
    return addWhereClauseInternal(const WhereClause(
      indexName: 'phone',
      lower: [null],
      includeLower: false,
    ));
  }

  QueryBuilder<User, User, QAfterWhereClause> usernameEqualTo(
      String? username) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'username',
      lower: [username],
      includeLower: true,
      upper: [username],
      includeUpper: true,
    ));
  }

  QueryBuilder<User, User, QAfterWhereClause> usernameNotEqualTo(
      String? username) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: 'username',
        upper: [username],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'username',
        lower: [username],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: 'username',
        lower: [username],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'username',
        upper: [username],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<User, User, QAfterWhereClause> usernameIsNull() {
    return addWhereClauseInternal(const WhereClause(
      indexName: 'username',
      upper: [null],
      includeUpper: true,
      lower: [null],
      includeLower: true,
    ));
  }

  QueryBuilder<User, User, QAfterWhereClause> usernameIsNotNull() {
    return addWhereClauseInternal(const WhereClause(
      indexName: 'username',
      lower: [null],
      includeLower: false,
    ));
  }
}

extension UserQueryFilter on QueryBuilder<User, User, QFilterCondition> {
  QueryBuilder<User, User, QAfterFilterCondition> $storeIdIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: '\$storeId',
      value: null,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> $storeIdEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: '\$storeId',
      value: value,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> $storeIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: '\$storeId',
      value: value,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> $storeIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: '\$storeId',
      value: value,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> $storeIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: '\$storeId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> emailIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'email',
      value: null,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> emailEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'email',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> emailGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'email',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> emailLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'email',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> emailBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'email',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> emailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'email',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> emailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'email',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> emailContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'email',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> emailMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'email',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> idGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> idLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'id',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'id',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> idContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'id',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> idMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'id',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> phoneIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'phone',
      value: null,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> phoneEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'phone',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> phoneGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'phone',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> phoneLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'phone',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> phoneBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'phone',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> phoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'phone',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> phoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'phone',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> phoneContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'phone',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> phoneMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'phone',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> usernameIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'username',
      value: null,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> usernameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'username',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> usernameGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'username',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> usernameLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'username',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> usernameBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'username',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> usernameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'username',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> usernameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'username',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> usernameContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'username',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<User, User, QAfterFilterCondition> usernameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'username',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension UserQueryLinks on QueryBuilder<User, User, QFilterCondition> {}

extension UserQueryWhereSortBy on QueryBuilder<User, User, QSortBy> {
  QueryBuilder<User, User, QAfterSortBy> sortBy$storeId() {
    return addSortByInternal('\$storeId', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortBy$storeIdDesc() {
    return addSortByInternal('\$storeId', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByEmail() {
    return addSortByInternal('email', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByEmailDesc() {
    return addSortByInternal('email', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByPhone() {
    return addSortByInternal('phone', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByPhoneDesc() {
    return addSortByInternal('phone', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByUsername() {
    return addSortByInternal('username', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> sortByUsernameDesc() {
    return addSortByInternal('username', Sort.desc);
  }
}

extension UserQueryWhereSortThenBy on QueryBuilder<User, User, QSortThenBy> {
  QueryBuilder<User, User, QAfterSortBy> thenBy$storeId() {
    return addSortByInternal('\$storeId', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenBy$storeIdDesc() {
    return addSortByInternal('\$storeId', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByEmail() {
    return addSortByInternal('email', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByEmailDesc() {
    return addSortByInternal('email', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByPhone() {
    return addSortByInternal('phone', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByPhoneDesc() {
    return addSortByInternal('phone', Sort.desc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByUsername() {
    return addSortByInternal('username', Sort.asc);
  }

  QueryBuilder<User, User, QAfterSortBy> thenByUsernameDesc() {
    return addSortByInternal('username', Sort.desc);
  }
}

extension UserQueryWhereDistinct on QueryBuilder<User, User, QDistinct> {
  QueryBuilder<User, User, QDistinct> distinctBy$storeId() {
    return addDistinctByInternal('\$storeId');
  }

  QueryBuilder<User, User, QDistinct> distinctByEmail(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('email', caseSensitive: caseSensitive);
  }

  QueryBuilder<User, User, QDistinct> distinctById(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('id', caseSensitive: caseSensitive);
  }

  QueryBuilder<User, User, QDistinct> distinctByPhone(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('phone', caseSensitive: caseSensitive);
  }

  QueryBuilder<User, User, QDistinct> distinctByUsername(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('username', caseSensitive: caseSensitive);
  }
}

extension UserQueryProperty on QueryBuilder<User, User, QQueryProperty> {
  QueryBuilder<User, int?, QQueryOperations> $storeIdProperty() {
    return addPropertyNameInternal('\$storeId');
  }

  QueryBuilder<User, String?, QQueryOperations> emailProperty() {
    return addPropertyNameInternal('email');
  }

  QueryBuilder<User, String, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<User, String?, QQueryOperations> phoneProperty() {
    return addPropertyNameInternal('phone');
  }

  QueryBuilder<User, String?, QQueryOperations> usernameProperty() {
    return addPropertyNameInternal('username');
  }
}
