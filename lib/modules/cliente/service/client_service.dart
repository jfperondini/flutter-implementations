import 'package:my_api/api/http_client_interface.dart';
import 'package:my_api/modules/cliente/models/cliente_model.dart';

const url_cliente = '/pessoa/1';

class JsonPlaceholderServiceCliente {
  final iHttpClient client;

  JsonPlaceholderServiceCliente(this.client);

  Future<List<ClienteModel>> getClienteTodos() async {
    final response = await client.get(url_cliente);
    final result = response as List;
    return result.map((e) => ClienteModel.fromJson(e)).toList();
  }
}
