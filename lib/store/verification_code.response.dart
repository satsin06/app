import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'verification_code.response.g.dart';

@JsonSerializable()
class VerificationCodeResponse extends _VerificationCodeResponse with _$VerificationCodeResponse {
  VerificationCodeResponse();

  factory VerificationCodeResponse.fromJson(Map<String, dynamic> json) => _$VerificationCodeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VerificationCodeResponseToJson(this);
}

abstract class _VerificationCodeResponse with Store {
  @observable
  String? context;

  @observable
  int? period = 60;

  @observable
  DateTime? expiredAt;

  @action
  void update(VerificationCodeResponse response) {
    context = response.context;
    period = response.period;
    expiredAt = response.expiredAt;
  }
}
