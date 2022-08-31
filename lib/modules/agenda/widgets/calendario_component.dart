import 'package:flutter/material.dart';
import 'package:my_api/modules/agenda/widgets/calendario/calendart_widget.dart';

import 'package:my_api/modules/agenda/widgets/hearder_calendario_component.dart';

import 'calendario/calendart_widget.dart';

class Calendario extends StatefulWidget {
  const Calendario({Key? key}) : super(key: key);

  @override
  State<Calendario> createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: size.height * 0.02, horizontal: size.width * 0.02),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: const [
          HeaderCalendario(),
          SizedBox(height: 20),
          CalendarWidget(),
          SizedBox(height: 20),
          //ListaTarefa(),
        ],
      ),
    );
  }
}
