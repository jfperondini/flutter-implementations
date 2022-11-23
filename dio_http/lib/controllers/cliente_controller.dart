import 'package:flutter/material.dart';
import 'package:my_api/services/json_placeholders_service_cliente.dart';

import '../models/cliente_model.dart';

class ClienteController extends ChangeNotifier {
  final JsonPlaceholderServiceCliente _service;
  var cliente = <ClienteModel>[];

  ClienteController(this._service);

  Future<void> fetchAllCliente() async {
    cliente = await _service.getClienteTodos();
    notifyListeners();
  }
}
