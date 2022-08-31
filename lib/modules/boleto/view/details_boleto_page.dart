import 'package:flutter/material.dart';

import 'package:my_api/modules/boleto/models/boleto_model.dart';
import 'package:my_api/modules/boleto/view/boleto_pdf_page.dart';
import 'package:qr_flutter/qr_flutter.dart';



class DetailsBoletoPage extends StatelessWidget {
  const DetailsBoletoPage({Key? key, required this.args}) : super(key: key);

  final BoletoModel args;
  @override
  Widget build(BuildContext context) {
    BoletoModel args =
        ModalRoute.of(context)!.settings.arguments as BoletoModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.numeroduplicata),
      ),
      body: Container(
        padding: const EdgeInsets.all(28),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            args.razaosocialcliente,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Data de vencimento ${args.datadovencimento}',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Valor do Boleto: ${args.valordodocumento}0',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Linha Digitavel: ${args.observacaorecebimento.linhaDigitavel}',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Observacao: ${args.observacao}0',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => PdfBoletoPage(boletoModel: args)),
              );
            },
            child: const Text('Vizualizar o Pdf'),
          ),
          const SizedBox(height: 24),
          Center(
            child: QrImage(
              data: args.qrcode_emv,
              size: 200,
            ),
          ),
        ]),
      ),
    );
  }
}
