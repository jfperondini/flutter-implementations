class ProdutoModel {
  final String preco;
  final String foto;
  final String nome;

  ProdutoModel(
    this.preco,
    this.foto,
    this.nome,
  );

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'preco': preco,
      'foto': foto,
      'nome': nome,
    };
  }

  factory ProdutoModel.fromJson(Map<String, dynamic> json) {
    return ProdutoModel(
      json['preco'] as String,
      json['foto'] as String,
      json['nome'] as String,
    );
  }
}
