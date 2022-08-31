import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_api/modules/login/controller/login_controller.dart';
import 'package:my_api/modules/login/widgets/login_components.dart';
import 'package:my_api/style/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController controller = Modular.get<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: chumboEsczClr,
        body: Column(
          children: const [
            LoginComponents(),
          ],
        ));
  }
}
