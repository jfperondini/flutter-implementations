import 'package:my_api/services/http_client_interface.dart';
import '../models/cliente_model.dart';

const url_cliente = 'http://192.168.2.100:9001/cliente/';

class ClienteService {
  final iHttpClient client;

  ClienteService(this.client);

  Future<List<ClienteModel>> getClienteTodos() async {
    final body = await client.get(url_cliente);
    return (body as List).map(ClienteModel.fromJson).toList();
  }
}
