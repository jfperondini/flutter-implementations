import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_api/modules/home/controller/home_controller.dart';
import 'package:my_api/modules/home/view/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeController()),
  ];

  //importar
  // @override
  // List<Module> get imports => [ClienteModule()];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/home', child: (_, args) => const HomePage()),
  ];
}


