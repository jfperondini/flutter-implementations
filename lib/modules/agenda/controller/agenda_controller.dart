import 'package:flutter/material.dart';
import 'package:my_api/modules/agenda/models/agenda_model.dart';

import '../service/agenda_service.dart';

class AgendaController extends ChangeNotifier {
  final JsonPlaceholderServiceAgenda _service;
  var agenda = <AgendaModel>[];

  AgendaController(this._service);

  Future<void> fetchAgenda() async {
    agenda = await _service.getAgendaTodos();
    notifyListeners();
  }
}
