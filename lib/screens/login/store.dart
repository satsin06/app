import 'package:mobx/mobx.dart';
import 'package:phone_form_field/phone_form_field.dart';

part 'store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  PhoneNumber? phone;

  @observable
  String? code;

  @observable
  bool agreement = false;

  @observable
  int countdown = 0;

  void dispose() {
    phone = null;
    code = null;
    agreement = false;
  }
}
