// import 'package:flutter/material.dart';
// import 'package:my_api/modules/boleto/view/boleto_page.dart';

// import 'package:my_api/modules/cliente/view/cliente_page.dart';
// import 'package:my_api/modules/home/view/home_page.dart';

// class SideBar extends StatelessWidget {
//   const SideBar({Key? key, required this.onClickButton}) : super(key: key);

//   final Function(Widget) onClickButton;

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return SingleChildScrollView(
//       padding: EdgeInsets.symmetric(
//           vertical: size.height * 0.02, horizontal: size.width * 0.02),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ListTile(
//               leading: const Icon(Icons.person),
//               title: const Text('Cliente'),
//               onTap: () {
//                 onClickButton(const ClientePage());
//               }),
//           ListTile(
//               leading: const Icon(Icons.receipt_long),
//               title: const Text('Boleto'),
//               onTap: () {
//                 onClickButton(const BoletoPage());
//               }),
//         ],
//       ),
//     );
//   }
// }
