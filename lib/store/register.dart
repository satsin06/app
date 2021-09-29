import 'package:get_it/get_it.dart';
import 'package:socfony/store/verification_code.response.dart';

void storeRegister() {
  GetIt.instance.registerLazySingleton(() => VerificationCodeResponse());
}
