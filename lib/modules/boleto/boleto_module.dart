import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_api/modules/boleto/controllers/boleto_controller.dart';
import 'package:my_api/modules/boleto/controllers/pdf_boleto_controller.dart';
import 'package:my_api/modules/boleto/services/boleto_pdf_service.dart';
import 'package:my_api/modules/boleto/services/boleto_service.dart';
import 'package:my_api/modules/boleto/view/boleto_page.dart';
import 'package:my_api/modules/boleto/view/details_boleto_page.dart';

class BoletoModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => BoletoController(i())),
    Bind.singleton((i) => PdfBoletoController(i())),
    Bind.singleton((i) => JsonPlaceholderServiceBoleto(i())),
    Bind.singleton((i) => JsonPlaceholderServicePdfBoleto(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/boleto', child: (_, __) => const BoletoPage()),
    ChildRoute('/detailsboleto',
        child: (_, args) => DetailsBoletoPage(args: args.data)),
  ];
}
