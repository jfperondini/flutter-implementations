import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared/api/dio/dio_client.dart';
import 'package:shared/modules/collections_module.dart';

import 'api/client_interface.dart';

class SuporteModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<IHttpClient>((i) => DioClient()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: CollectionsModule()),
      ];
}
