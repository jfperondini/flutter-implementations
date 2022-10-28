import 'package:flutter_modular/flutter_modular.dart';

import 'package:project/api/dio/dio_client.dart';
import 'package:project/modules/home/home_module.dart';

import 'api/client_interface.dart';

class ProjectModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<IHttpClient>((i) => DioClient(
              baseUrl: 'https://endereço_da_sua_api.com.br',
            )),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: HomeModule()),
      ];
}
