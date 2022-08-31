class ClienteModel {
  final int idPessoa;

  final String razaosocial;

  final String cnpjCpf;

  ClienteModel({
    required this.idPessoa,
    required this.razaosocial,
    required this.cnpjCpf,
  });

  static ClienteModel fromJson(dynamic map) {
    return ClienteModel(
      idPessoa: map['idPessoa'],
      cnpjCpf: map['cnpjCpf'],
      razaosocial: map['razaosocial'],
    );
  }

  static ClienteModel stub() => ClienteModel(
        idPessoa: 1,
        cnpjCpf: '312312',
        razaosocial: 'name',
      );
}
