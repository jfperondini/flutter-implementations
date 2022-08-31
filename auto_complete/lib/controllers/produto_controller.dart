import 'package:flutter/material.dart';
import 'package:auto_complete/models/produto_model.dart';
import 'package:auto_complete/services/produto_service.dart';

class ProdutoController extends ChangeNotifier {
  final JsonPlaceholderServiceProduto _service;
  var cliente = <ProdutoModel>[];

  ProdutoController(this._service);

  Future<void> fetchAllProduto() async {
    cliente = await _service.getProdutosTodos();
    notifyListeners();
  }
}

