import 'package:flutter/material.dart';
import 'package:my_api/modules/boleto/models/pdf_boleto_model.dart';

import '../services/boleto_pdf_service.dart';

class PdfBoletoController extends ChangeNotifier {
  final JsonPlaceholderServicePdfBoleto _service;
  var pdfboleto = <PdfBoletoModel>[];

  PdfBoletoController(this._service);

  Future fetchPdfBoleto(String cnpjCpf, String datadovencimento) async {
    pdfboleto = await _service.getPdfBoleto(cnpjCpf, datadovencimento);
    notifyListeners();
  }
}
