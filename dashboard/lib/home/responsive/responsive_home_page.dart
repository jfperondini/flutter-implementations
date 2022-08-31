// import 'package:flutter/material.dart';
// import 'package:my_api/config/responsive_widget.dart';
// import 'package:my_api/modules/agenda/widgets/calendario_component.dart';
// import 'package:my_api/modules/home/widgets/header/header_home_components.dart';
// import 'package:my_api/modules/home/widgets/side_bar_components.dart';

// import 'package:my_api/modules/menu/view/app_menu.dart';

// class ResponsiveHomePage extends StatefulWidget {
//   const ResponsiveHomePage({Key? key}) : super(key: key);

//   @override
//   State<ResponsiveHomePage> createState() => _ResponsiveHomePageState();
// }

// class _ResponsiveHomePageState extends State<ResponsiveHomePage> {
//   @override
//   Widget _center = const HeaderHome();
//   Widget build(BuildContext context) {
//     return ResponsiveWidget(
//       _mobile(context),
//       _tablet(context),
//       _desktop(context),
//     );
//   }

//   void onClickButton(Widget center) {
//     setState(() {
//       _center = center;
//     });
//   }

//   Widget _mobile(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       drawer: const MenuApp(),
//       appBar: AppBar(
//         title: const Text('Home Page'),
//       ),
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: size.height * 0.5,
//               child: const HeaderHome(),
//             ),
//             SizedBox(
//               height: size.height * 0.5,
//               child: const Calendario(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _tablet(BuildContext context) {
//     return Scaffold(
//         drawer: const MenuApp(),
//         appBar: AppBar(
//           title: const Text('Home Page'),
//         ));
//   }

//   Widget _desktop(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home Page'),
//       ),
//       body: SafeArea(
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               width: size.width * 0.2,
//               child: SideBar(onClickButton: onClickButton),
//             ),
//             SizedBox(
//               width: size.width * 0.5,
//               child: _center,
//             ),
//             SizedBox(
//               width: size.width * 0.3,
//               child: const Calendario(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
