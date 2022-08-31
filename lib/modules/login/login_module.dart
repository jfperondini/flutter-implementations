import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_api/modules/login/controller/login_controller.dart';
import 'package:my_api/modules/login/view/login_page.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const LoginPage()),
  ];
}
