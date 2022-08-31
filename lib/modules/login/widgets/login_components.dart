import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_api/modules/login/controller/login_controller.dart';
import 'package:my_api/modules/login/widgets/card_login_components.dart';

class LoginComponents extends StatefulWidget {
  const LoginComponents({Key? key}) : super(key: key);

  @override
  State<LoginComponents> createState() => _LoginComponentsState();
}

class _LoginComponentsState extends State<LoginComponents> {
 final LoginController controller = Modular.get<LoginController>();
 
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CardLogin(),
            ],
          ),
        ),
      ),
    );
  }
}
