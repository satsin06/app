// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_code.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerificationCodeResponse _$VerificationCodeResponseFromJson(
        Map<String, dynamic> json) =>
    VerificationCodeResponse()
      ..context = json['context'] as String?
      ..period = json['period'] as int?
      ..expiredAt = json['expiredAt'] == null
          ? null
          : DateTime.parse(json['expiredAt'] as String);

Map<String, dynamic> _$VerificationCodeResponseToJson(
        VerificationCodeResponse instance) =>
    <String, dynamic>{
      'context': instance.context,
      'period': instance.period,
      'expiredAt': instance.expiredAt?.toIso8601String(),
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$VerificationCodeResponse on _VerificationCodeResponse, Store {
  final _$contextAtom = Atom(name: '_VerificationCodeResponse.context');

  @override
  String? get context {
    _$contextAtom.reportRead();
    return super.context;
  }

  @override
  set context(String? value) {
    _$contextAtom.reportWrite(value, super.context, () {
      super.context = value;
    });
  }

  final _$periodAtom = Atom(name: '_VerificationCodeResponse.period');

  @override
  int? get period {
    _$periodAtom.reportRead();
    return super.period;
  }

  @override
  set period(int? value) {
    _$periodAtom.reportWrite(value, super.period, () {
      super.period = value;
    });
  }

  final _$expiredAtAtom = Atom(name: '_VerificationCodeResponse.expiredAt');

  @override
  DateTime? get expiredAt {
    _$expiredAtAtom.reportRead();
    return super.expiredAt;
  }

  @override
  set expiredAt(DateTime? value) {
    _$expiredAtAtom.reportWrite(value, super.expiredAt, () {
      super.expiredAt = value;
    });
  }

  final _$_VerificationCodeResponseActionController =
      ActionController(name: '_VerificationCodeResponse');

  @override
  void update(VerificationCodeResponse response) {
    final _$actionInfo = _$_VerificationCodeResponseActionController
        .startAction(name: '_VerificationCodeResponse.update');
    try {
      return super.update(response);
    } finally {
      _$_VerificationCodeResponseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
context: ${context},
period: ${period},
expiredAt: ${expiredAt}
    ''';
  }
}
