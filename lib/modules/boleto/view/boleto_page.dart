import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_api/modules/boleto/controllers/boleto_controller.dart';

import 'package:my_api/modules/menu/view/app_menu.dart';

class BoletoPage extends StatefulWidget {
  const BoletoPage({Key? key}) : super(key: key);

  @override
  State<BoletoPage> createState() => _BoletoPageState();
}

class _BoletoPageState extends State<BoletoPage> {
  final controller = Modular.get<BoletoController>();

  @override
  void initState() {
    super.initState();
    getAllBoleto();
  }

  getAllBoleto() async {
    await controller.fetchAllBoleto();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const MenuApp(),
        appBar: AppBar(
          title: const Text('Boleto Page'),
        ),
        body: AnimatedBuilder(
          animation: controller,
          builder: (context, widget) {
            return ListView.builder(
              itemCount: controller.boleto.length,
              itemBuilder: (context, index) {
                final _boleto = controller.boleto[index];
                return ListTile(
                  leading: Text(_boleto.numeroduplicata),
                  trailing: const Icon(Icons.arrow_forward),
                  title: Text('R\$${_boleto.valordodocumento}'),
                  onTap: () => Navigator.of(context).pushNamed('/detailsboleto',
                      arguments: controller.boleto[index]),
                );
              },
            );
          },
        ));
  }
}
