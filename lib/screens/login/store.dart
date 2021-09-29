import 'package:mobx/mobx.dart';

part 'store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  String? country = '+86';

  @observable
  String phone = '';

  @observable
  String code = '';

  @observable
  bool agreement = false;

  @observable
  int countdown = 0;

  @computed
  String get e164 => (country ?? '') + phone;

  void dispose() {
    phone = '';
    code = '';
    agreement = false;
  }
}
