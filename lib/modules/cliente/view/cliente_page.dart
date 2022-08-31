import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_api/modules/cliente/controller/cliente_controller.dart';
import 'package:my_api/modules/menu/view/app_menu.dart';

class ClientePage extends StatefulWidget {
  const ClientePage({key}) : super(key: key);

  @override
  State<ClientePage> createState() => _ClientePageState();
}

class _ClientePageState extends State<ClientePage> {
  final controller = Modular.get<ClienteController>();

  @override
  void initState() {
    super.initState();
    controller.fetchCliente();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const MenuApp(),
        appBar: AppBar(
          title: const Text('Cliente Page'),
        ),
        body: Column(
          children: [
            //const BuscarCliente(),
            Expanded(
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, widget) {
                  return ListView.builder(
                    itemCount: controller.cliente.length,
                    itemBuilder: (context, index) {
                      final _cliente = controller.cliente[index];
                      return ListTile(
                        leading: Text(_cliente.cnpjCpf),
                        trailing: const Icon(Icons.arrow_forward),
                        title: Text(_cliente.nomefantasia),
                        subtitle: (Text(_cliente.cnpjCpf)),
                        onTap: () => Navigator.of(context).pushNamed(
                            '/detailsclientews',
                            arguments: controller.cliente[index]),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ));
  }
}
