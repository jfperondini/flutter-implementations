import 'dart:convert';
import 'dart:typed_data';

class PdfBoletoModel {
  Uint8List arquivopdf;
  String sucesso;

  PdfBoletoModel({
    required this.arquivopdf,
    required this.sucesso,
  });

  static PdfBoletoModel fromJson(dynamic map) {
    return PdfBoletoModel(
      sucesso: map['sucesso'],
      arquivopdf:
          base64.decode(map['arquivopdf'].toString().replaceAll('\r\n', '')),
    );
  }
}
