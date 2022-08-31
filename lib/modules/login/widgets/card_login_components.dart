import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_api/modules/login/controller/login_controller.dart';

import 'package:my_api/shared/components/text_field_componet.dart';

class CardLogin extends StatefulWidget {
  const CardLogin({Key? key}) : super(key: key);

  @override
  State<CardLogin> createState() => _CardLoginState();
}

class _CardLoginState extends State<CardLogin> {
  final LoginController controller = Modular.get<LoginController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: size.height * 0.01, horizontal: size.width * 0.01),
        child: Column(children: [
          TextFieldComponent(
            passwoardVisibility: false,
            textController: controller.cnpjController,
            labelText: 'Cnpj',
            hintText: 'digite seu cnpj',
            textInputType: TextInputType.number,
            validator: controller.validateCnpj,
          ),
          const SizedBox(height: 10),
          TextField(
            obscureText: controller.passwoardVisibility,
            controller: controller.senhaController,
            decoration: InputDecoration(
              labelText: 'Senha',
              hintText: 'digite sua senha',
              border: const OutlineInputBorder(),
              suffix: IconButton(
                  onPressed: () {
                    controller.switchVisibility();
                    setState(() {});
                  },
                  icon: Icon(controller.passwoardVisibility
                      ? Icons.visibility
                      : Icons.visibility_off)),
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              setState(() {
                Modular.to.pushNamed('/home');
                controller.validateLogin();
              });
            },
            child: const Text('Entrar'),
          )
        ]),
      ),
    );
  }
}
