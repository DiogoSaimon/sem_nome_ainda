import 'package:flutter_modular/flutter_modular.dart';
import 'package:sem_nome_ainda/src/login_auth/presentation/pages/home_page.dart';

class LoginAuthModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child("/", child: (context) => HomePage());
  }
}
