import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_api/modules/cliente/controller/cliente_controller.dart';
import 'package:my_api/modules/cliente/service/client_service.dart';

import 'package:my_api/modules/cliente/view/cliente_page.dart';
import 'package:my_api/modules/cliente/view/details_cliente_page.dart';

class ClienteModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => ClienteController(i())),
    Bind.singleton((i) => JsonPlaceholderServiceCliente(i())),
  ];

  //importar
  // @override
  // List<Module> get imports => [ClienteModule()];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/clientews', child: (_, __) => const ClientePage()),
    ChildRoute('/detailsclientews',
        child: (_, args) => DetailsClientePage(args: args.data)),
  ];
}
