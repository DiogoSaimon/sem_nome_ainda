import 'package:flutter_modular/flutter_modular.dart';
import 'package:sem_nome_ainda/src/login_auth/login_auth_module.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.module("/", module: LoginAuthModule());
  }
}
