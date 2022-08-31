import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_api/modules/agenda/widgets/calendario_component.dart';
import 'package:my_api/modules/home/controller/home_controller.dart';
import 'package:my_api/modules/home/widgets/dashboard_home_components.dart';
import 'package:my_api/modules/menu/view/app_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        drawer: const MenuApp(),
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(children: [
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              width: size.width * 0.7,
              child: const DashboardHome(),
            ),
            SizedBox(
              width: size.width * 0.3,
              child: const Calendario(),
            ),
          ])
        ]))));
  }
}
