import 'package:my_api/api/http_client_interface.dart';
import '../models/boleto_model.dart';

const url_boleto = '';
// 'http://18.228.152.45:213/datasnap/rest/TSMReceber/Receber//19869407000188///0/';

class JsonPlaceholderServiceBoleto {
  final iHttpClient boleto;

  JsonPlaceholderServiceBoleto(this.boleto);

  Future<List<BoletoModel>> getBoletoTodos() async {
    final response = await boleto.get(url_boleto);
    final result = response['result'][0] as List;
    return result.map((e) => BoletoModel.fromJson(e)).toList();
  }
}
