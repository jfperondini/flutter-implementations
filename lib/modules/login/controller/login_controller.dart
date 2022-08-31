import 'package:flutter/material.dart';

class LoginController with ChangeNotifier {
  bool passwoardVisibility = true;
  bool isLoginValid = false;

  final TextEditingController cnpjController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  void switchVisibility() {
    passwoardVisibility = !passwoardVisibility;
    notifyListeners();
  }

  validateLogin() {
    if (cnpjController.text == '123' && senhaController.text == '123') {
      isLoginValid = true;
      //Modular.to.pushNamed('/home');
      notifyListeners();
    } else {}
  }

  String? validateCnpj(String? text) {
    if (text == null || text.isEmpty) {
      return 'este campo não pode estar vazio';
    }
    return null;
  }
}
