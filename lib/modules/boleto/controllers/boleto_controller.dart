import 'package:flutter/material.dart';
import 'package:my_api/modules/boleto/models/boleto_model.dart';
import 'package:my_api/modules/boleto/services/boleto_service.dart';


class BoletoController with ChangeNotifier {
  final JsonPlaceholderServiceBoleto _service;
  var boleto = <BoletoModel>[];

  BoletoController(this._service);

  Future fetchAllBoleto() async {
    boleto = await _service.getBoletoTodos();
    notifyListeners();
  }
}
