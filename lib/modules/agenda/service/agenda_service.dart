import 'package:my_api/api/http_client_interface.dart';

import '../models/agenda_model.dart';

const url_agenda = '';

class JsonPlaceholderServiceAgenda {
  final iHttpClient agenda;

  JsonPlaceholderServiceAgenda(this.agenda);

  Future<List<AgendaModel>> getAgendaTodos() async {
    final response = await agenda.get(url_agenda);
    final result = response as List;
    return result.map((e) => AgendaModel.fromJson(e)).toList();
  }
}
