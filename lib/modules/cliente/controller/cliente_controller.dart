import 'package:flutter/material.dart';
import 'package:my_api/modules/cliente/models/cliente_model.dart';

import 'package:my_api/modules/cliente/service/client_service.dart';

class ClienteController with ChangeNotifier {
  final JsonPlaceholderServiceCliente _service;
  var cliente = <ClienteModel>[];

  ClienteController(this._service);

  Future<void> fetchCliente() async {
    cliente = await _service.getClienteTodos();
    notifyListeners();
  }
}
