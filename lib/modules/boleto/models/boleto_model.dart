import 'dart:convert';

import 'package:my_api/modules/boleto/models/obs_recebimento_boleto_model.dart';

class BoletoModel {
  String id_receber;
  String id_empresa;
  String numeronotafiscal;
  String numeroparcela;
  String numeroduplicata;
  String numeroboleto;
  String id_cliente;
  String razaosocialcliente;
  String cnpj_cpf;
  String datadaemissao;
  String datadovencimento;
  String valordodocumento;
  String multa_valor;
  String multa_porcentagem;
  String jurosdia_valor;
  String jurosdia_porcentagem;
  String datadorecebimento;
  String valordorecebimento;
  String multarecebido_valor;
  String jurosrecebido_valor;
  String descontoconcedido;
  String valorabatimento;
  String datadoprotesto;
  String quitado;
  String id_contacorrente;
  String statusboleto_rem_ret;
  String observacao;
  Observacaorecebimento observacaorecebimento;
  String enviarparaprotesto;
  String excluido;
  String totalparcelas;
  String baixasolicitada;
  String arquivopdf;
  String qrcode_emv;

  BoletoModel({
    required this.id_receber,
    required this.id_empresa,
    required this.numeronotafiscal,
    required this.numeroparcela,
    required this.numeroduplicata,
    required this.numeroboleto,
    required this.id_cliente,
    required this.razaosocialcliente,
    required this.cnpj_cpf,
    required this.datadaemissao,
    required this.datadovencimento,
    required this.valordodocumento,
    required this.multa_valor,
    required this.multa_porcentagem,
    required this.jurosdia_valor,
    required this.jurosdia_porcentagem,
    required this.datadorecebimento,
    required this.valordorecebimento,
    required this.multarecebido_valor,
    required this.jurosrecebido_valor,
    required this.descontoconcedido,
    required this.valorabatimento,
    required this.datadoprotesto,
    required this.quitado,
    required this.id_contacorrente,
    required this.statusboleto_rem_ret,
    required this.observacao,
    required this.observacaorecebimento,
    required this.enviarparaprotesto,
    required this.excluido,
    required this.totalparcelas,
    required this.baixasolicitada,
    required this.arquivopdf,
    required this.qrcode_emv,
  });

  static BoletoModel fromJson(dynamic map) {
    return BoletoModel(
      id_receber: map['id_receber'],
      id_empresa: map["id_empresa"],
      numeronotafiscal: map["numeronotafiscal"],
      numeroparcela: map["numeroparcela"],
      numeroduplicata: map["numeroduplicata"],
      numeroboleto: map["numeroboleto"],
      id_cliente: map["id_cliente"],
      razaosocialcliente: map["razaosocialcliente"],
      cnpj_cpf: map["cnpj_cpf"],
      datadaemissao: map["datadaemissao"],
      datadovencimento: map["datadovencimento"],
      valordodocumento: map["valordodocumento"],
      multa_valor: map["multa_valor"],
      multa_porcentagem: map["multa_porcentagem"],
      jurosdia_valor: map["jurosdia_valor"],
      jurosdia_porcentagem: map["jurosdia_porcentagem"],
      datadorecebimento: map["datadorecebimento"],
      valorabatimento: map["valordorecebimento"],
      multarecebido_valor: map["multarecebido_valor"],
      jurosrecebido_valor: map["jurosrecebido_valor"],
      descontoconcedido: map["descontoconcedido"],
      valordorecebimento: map["valordorecebimento"],
      datadoprotesto: map["datadoprotesto"],
      quitado: map["quitado"],
      id_contacorrente: map["id_contacorrente"],
      statusboleto_rem_ret: map["statusboleto_rem_ret"],
      observacao: map["observacao"],
      observacaorecebimento:
          Observacaorecebimento.fromJson(jsonDecode(map["observacaorecebimento"]
              .toString()
              //retirar string que esta no final do json
              .replaceAll('02 – Entrada confirmada', ''))),
      enviarparaprotesto: map["enviarparaprotesto"],
      excluido: map["excluido"],
      totalparcelas: map["totalparcelas"],
      baixasolicitada: map["baixasolicitada"],
      arquivopdf: map["arquivopdf"],
      qrcode_emv: map["qrcode_emv"],
    );
  }

//teste;
  //static BoletoModel stub() => BoletoModel(
  //    id_receber: '1',
  //);
}
