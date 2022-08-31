import 'package:auto_complete/api/http_client_interface.dart';
import 'package:auto_complete/models/produto_model.dart';

const url_cliente = 'https://62e0383998dd9c9df60ff4b5.mockapi.io/produto';

class JsonPlaceholderServiceProduto {
  final iHttpClient produto;

  JsonPlaceholderServiceProduto(this.produto);

  Future<List<ProdutoModel>> getProdutosTodos() async {
    final response = await produto.get(url_cliente);
    final result = response as List;
    return result.map((e) => ProdutoModel.fromJson(e)).toList();
  }
}
