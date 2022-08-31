import 'package:flutter/material.dart';
import 'package:my_api/modules/cliente/models/cliente_model.dart';

class DetailsClientePage extends StatelessWidget {
  const DetailsClientePage({Key? key, required this.args}) : super(key: key);

  final ClienteModel args;
  @override
  Widget build(BuildContext context) {
    ClienteModel args =
        ModalRoute.of(context)!.settings.arguments as ClienteModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.nomefantasia),
      ),
      body: Container(
        padding: const EdgeInsets.all(28),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            args.razaosocial,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'CPF: ${args.cnpjCpf}',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Telefone: ${args.cnpjCpf}',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Email: ${args.cnpjCpf}',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Endereço: ${args.cnpjCpf}, n° ${args.cnpjCpf}',
          ),
          Text(
            'Complemento: ${args.cnpjCpf}',
          ),
          Text(
            'Bairro: ${args.cnpjCpf}, Cidade: ${args.cnpjCpf}',
          ),
          Text(
            'CEP ${args.cnpjCpf}',
          ),
        ]),
      ),
    );
  }
}
