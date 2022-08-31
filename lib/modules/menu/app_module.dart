import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_api/api/dio_client.dart';
//import 'package:my_api/api/dio_client.dart';
import 'package:my_api/api/http_client_interface.dart';
import 'package:my_api/modules/boleto/boleto_module.dart';
import 'package:my_api/modules/boleto/controllers/boleto_controller.dart';
import 'package:my_api/modules/cliente/cliente_module.dart';
import 'package:my_api/modules/cliente/controller/cliente_controller.dart';
import 'package:my_api/modules/home/controller/home_controller.dart';
import 'package:my_api/modules/home/home_module.dart';
import 'package:my_api/modules/login/controller/login_controller.dart';
import 'package:my_api/modules/login/login_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        // Bind.singleton<iHttpClient>((i) => DioClient()),
        Bind.singleton<iHttpClient>(
            (i) => DioClient(baseUrl: 'http://18.228.152.45:9001/')),
        // Bind.singleton<iHttpClient>(
        //     (i) => HttpPackageClient(baseUrl: 'http://18.228.152.45:9001/')),

        Bind.lazySingleton((i) => LoginController()),
        Bind.lazySingleton((i) => HomeController()),
        Bind.lazySingleton((i) => ClienteController(i())),
        Bind.lazySingleton((i) => BoletoController(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: LoginModule()),
        ModuleRoute(Modular.initialRoute, module: HomeModule()),
        ModuleRoute(Modular.initialRoute, module: ClienteModule()),
        ModuleRoute(Modular.initialRoute, module: BoletoModule()),
      ];
}
