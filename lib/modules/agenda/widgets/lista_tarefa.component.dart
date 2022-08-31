import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_api/config/size_config.dart';
import 'package:my_api/modules/agenda/controller/agenda_controller.dart';
import 'package:my_api/modules/agenda/widgets/card_tarefa_component.dart';

class ListaTarefa extends StatefulWidget {
  const ListaTarefa({Key? key}) : super(key: key);

  @override
  State<ListaTarefa> createState() => _ListaTarefaState();
}

class _ListaTarefaState extends State<ListaTarefa> {
  final controller = Modular.get<AgendaController>();

  @override
  void initState() {
    super.initState();
    controller.fetchAgenda();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, widget) {
          return SizedBox(
            height: SizeConfig(this.context).screenHeight,
            child: ListView.builder(
                shrinkWrap: true, //list finito
                itemCount: controller.agenda.length,
                itemBuilder: (context, index) {
                  return CardTarefa();
                }),
          );
        });
  }
}
