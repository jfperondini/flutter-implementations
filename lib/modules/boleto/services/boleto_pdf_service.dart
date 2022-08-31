import 'package:my_api/api/http_client_interface.dart';

import '../models/pdf_boleto_model.dart';

class JsonPlaceholderServicePdfBoleto {
  final iHttpClient pdfboleto;

  JsonPlaceholderServicePdfBoleto(this.pdfboleto);

  Future<List<PdfBoletoModel>> getPdfBoleto(
      String cnpjCpf, String datadovencimento) async {
    String url_boleto_pdf = '';
    //'http://18.228.152.45:213/datasnap/rest/TSMReceber/Receber//$cnpjCpf///0/S/2022-09-10';
    final response = await pdfboleto.get(url_boleto_pdf);
    final result = response['result'][0] as List;
    return result.map((e) => PdfBoletoModel.fromJson(e)).toList();
  }
}
