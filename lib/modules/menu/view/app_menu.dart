import 'package:flutter/material.dart';
import 'package:my_api/shared/menu_list_component.dart';

class MenuApp extends StatelessWidget {
  const MenuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        const UserAccountsDrawerHeader(
          accountName: Text('Wisesoft'),
          accountEmail: Text('email@wiseosft.com.br'),
        ),
        MenuListTile('Home', 'tela de inicio', Icons.home, '/home'),
        MenuListTile('Cliente', 'tela de cliente', Icons.people, '/clientews'),
        MenuListTile(
            'Boletos', 'tela de boleto', Icons.receipt_long, '/boleto'),
        MenuListTile('Logout', 'finalizar sessão', Icons.logout, '/'),
      ]),
    );
  }
}
