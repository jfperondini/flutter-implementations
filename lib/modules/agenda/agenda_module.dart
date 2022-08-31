import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_api/modules/agenda/controller/agenda_controller.dart';
import 'package:my_api/modules/agenda/service/agenda_service.dart';
import 'package:my_api/modules/agenda/view/agenda_page.dart';

class AgendaModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AgendaController(i())),
    Bind.singleton((i) => JsonPlaceholderServiceAgenda(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/agenda', child: (_, __) => const AgendaPage()),
  ];
}
