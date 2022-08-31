import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_api/modules/agenda/view/agenda_page.dart';

class HeaderCalendario extends StatefulWidget {
  const HeaderCalendario({Key? key}) : super(key: key);

  @override
  State<HeaderCalendario> createState() => _HeaderCalendarioState();
}

class _HeaderCalendarioState extends State<HeaderCalendario> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [],
          ),
        ),
        ElevatedButton.icon(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AgendaPage()));
          },
          icon: const Icon(Icons.calendar_month),
          label: const Text('Add Tarefa'),
        )
      ],
    );
  }
}
