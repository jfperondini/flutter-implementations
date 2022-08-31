import 'dart:convert';

class ClienteModel {
  final String tipodepessoa;
  final String razaosocial;
  final String nomefantasia;
  final String cnpjCpf;

  // final String id_cliente;
  // final String razaosocial;
  // final String nomefantasia;
  // final String endereco;
  // final String numero;
  // final String complemento;
  // final String bairro;
  // final String cidade;
  // final String estado;
  //final String estado_doc;
  // final String cep;
  // final String pais;
  // final String endereco_cob;
  // final String numero_cob;
  // final String complemento_cob;
  // final String bairro_cob;
  // final String cidade_cob;
  // final String estado_cob;
  // final String cep_cob;
  // final String pais_cob;
  // final String telefone1;
  // final String telefone2;
  // final String telefone3;
  // final String cnpj_cpf;
  // final String ie_rg;
  //final String contato;
  // final String email;
  // final String id_representante;
  // final String codcli_contabil;
  // final String excluido;
  // final String status;
  // final String codmunicipio;
  // final String codmunicipio_cob;
  // final String inscricaosuframa;
  // final String observacao;
  // final String datadaultimacompra;
  // final String email_nfe;
  // final String inscricaomunicipal;
  // final String valormensal;
  // final String vencetododia;
  // final String emitenfs;
  // final String id_status;
  // final String indicador_ie;
  // final String validoate;
  // final String nfs_valornota;
  // final String id_produto;
  // final String enviarporemail;
  // final String enviarporcorreio;
  // final String tipo;
  // final String porte;
  // final String cnae1;
  // final String cnae1descricao;
  // final String cnae2;
  // final String cnae2descricao;
  // final String cnae3;
  // final String cnae3descricao;
  // final String cnae4;
  // final String cnae4descricao;
  // final String cnae5;
  // final String cnae5escricao;
  // final String cnae6;
  // final String cnae6descricao;
  // final String cnae7;
  // final String cnae7descricao;
  // final String cnae8;
  // final String cnae8descricao;
  // final String cnae9;
  // final String cnae9descricao;
  // final String cnae10;
  // final String cnae10descricao;
  // final String aprov_creditoicms;

  ClienteModel({
    required this.tipodepessoa,
    required this.razaosocial,
    required this.nomefantasia,
    required this.cnpjCpf,

    // required this.id_cliente,
    // required this.razaosocial,
    // required this.nomefantasia,
    // required this.endereco,
    // required this.numero,
    // required this.complemento,
    // required this.bairro,
    // required this.cidade,
    // required this.estado,
    // //required this.estado_doc,
    // required this.cep,
    // required this.pais,
    // required this.endereco_cob,
    // required this.numero_cob,
    // required this.complemento_cob,
    // required this.bairro_cob,
    // required this.cidade_cob,
    // required this.estado_cob,
    // required this.cep_cob,
    // required this.pais_cob,
    // required this.telefone1,
    // required this.telefone2,
    // required this.telefone3,
    // required this.cnpj_cpf,
    // required this.ie_rg,
    // required this.telefone1,
    // required this.email,
    // required this.id_representante,
    // required this.codcli_contabil,
    // required this.excluido,
    // required this.status,
    // required this.codmunicipio,
    // required this.codmunicipio_cob,
    // required this.inscricaosuframa,
    // required this.observacao,
    // required this.datadaultimacompra,
    // required this.email_nfe,
    // required this.inscricaomunicipal,
    // required this.valormensal,
    // required this.vencetododia,
    // required this.emitenfs,
    // required this.id_status,
    // required this.indicador_ie,
    // required this.validoate,
    // required this.nfs_valornota,
    // required this.id_produto,
    // required this.enviarporemail,
    // required this.enviarporcorreio,
    // required this.tipo,
    // required this.porte,
    // required this.cnae1,
    // required this.cnae1descricao,
    // required this.cnae2,
    // required this.cnae2descricao,
    // required this.cnae3,
    // required this.cnae3descricao,
    // required this.cnae4,
    // required this.cnae4descricao,
    // required this.cnae5,
    // required this.cnae5escricao,
    // required this.cnae6,
    // required this.cnae6descricao,
    // required this.cnae7,
    // required this.cnae7descricao,
    // required this.cnae8,
    // required this.cnae8descricao,
    // required this.cnae9,
    // required this.cnae9descricao,
    // required this.cnae10,
    // required this.cnae10descricao,
    // required this.aprov_creditoicms,
  });

  static ClienteModel fromJson(Map<String, dynamic> map) {
    return ClienteModel(
      tipodepessoa: map['tipodepessoa'] ?? '', //valor nulo
      razaosocial: map['razaosocial'] ?? '',
      nomefantasia: map['nomefantasia'] ?? '',
      cnpjCpf: map['cnpjCpf'] ?? '',

      // id_cliente: map['id_cliente'],
      // razaosocial: map['razaosocial'],
      // nomefantasia: map['nomefantasia'],
      // endereco: map['endereco'],
      // numero: map['numero'],
      // complemento: map['complemento'],
      // bairro: map['bairro'],
      // cidade: map['cidade'],
      // estado: map['estado'],
      // cep: map['cep'],
      // pais: map['pais'],
      // cnpj_cpf: map['cnpj_cpf'],
      // telefone1: map['telefone1'],
      // email: map['email'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tipodepessoa': tipodepessoa,
      'razaosocial': razaosocial,
      'nomefantasia': nomefantasia,
      'cnpjCpf': cnpjCpf,

      // 'id_cliente': id_cliente,
      // 'razaosocial': razaosocial,
      // 'nomefantasia': nomefantasia,
      // 'endereco': endereco,
      // 'numero': numero,
      // 'complemento': complemento,
      // 'bairro': bairro,
      // 'cidade': cidade,
      // 'estado': estado,
      // 'cep': cep,
      // 'pais': pais,
      // 'telefone1': telefone1,
      // 'cnpj_cpf': cnpj_cpf,
      // 'email': email,
    };
  }

  factory ClienteModel.fromMap(Map<String, dynamic> map) {
    return ClienteModel(
      tipodepessoa: map['tipodepessoa'] as String,
      razaosocial: map['razaosocial'] as String,
      nomefantasia: map['nomefantasia'] as String,
      cnpjCpf: map['cnpjCpf'] as String,

      // id_cliente: map['id_cliente'] as String,
      // razaosocial: map['razaosocial'] as String,
      // nomefantasia: map['nomefantasia'] as String,
      // endereco: map['endereco'] as String,
      // numero: map['numero'] as String,
      // complemento: map['complemento'] as String,
      // bairro: map['bairro'] as String,
      // cidade: map['cidade'] as String,
      // estado: map['estado'] as String,
      // cep: map['cep'] as String,
      // pais: map['pais'] as String,
      // telefone1: map['telefone1'] as String,
      // cnpj_cpf: map['cnpj_cpf'] as String,
      // email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

//   static ClienteModel stub() => ClienteModel(
//         id_cliente: '585',
//         razaosocial: 'GILSON CARDOSO DE OLIVEIRA & CIA LTDA',
//         nomefantasia: 'EMPORIO OLIVEIRA',
//         endereco: 'R CEL PEDRO PENTEADO',
//         numero: '79',
//         complemento: 'Ao lado',
//         bairro: 'CENTRO',
//         cidade: 'SERRA NE,GRA',
//         estado: 'SP',
//         cep: '13930000',
//         pais: 'BRASIL',
//         cnpj_cpf: '19869407000188',
//         telefone1: '19 38925756',
//         email: 'teste@gmail.com',
//       );
// }
}
