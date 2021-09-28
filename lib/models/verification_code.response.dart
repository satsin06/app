import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verification_code.response.g.dart';

@JsonSerializable()
class VerificationCodeResponse with ChangeNotifier {
  VerificationCodeResponse({
    this.expiredAt,
    this.period = 60,
  });

  late String context;

  int period;

  DateTime? expiredAt;

  factory VerificationCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$VerificationCodeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VerificationCodeResponseToJson(this);

  update(void Function(VerificationCodeResponse update) update) {
    update(this);
    notifyListeners();
  }
}
