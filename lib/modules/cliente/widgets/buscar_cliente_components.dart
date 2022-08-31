import 'package:flutter/material.dart';
import 'package:my_api/modules/cliente/view/pesquisa_cliente_page.dart';

class BuscarCliente extends StatefulWidget {
  const BuscarCliente({Key? key}) : super(key: key);

  @override
  State<BuscarCliente> createState() => _BuscarClienteState();
}

class _BuscarClienteState extends State<BuscarCliente> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Buscar Clientes'),
            ],
          ),
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: PesquisaClientePage());
            },
            icon: const Icon(Icons.search_rounded),
          )
        ],
      ),
    );
  }
}
