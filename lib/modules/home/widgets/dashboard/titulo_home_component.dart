import 'package:flutter/material.dart';
import 'package:my_api/modules/home/widgets/dashboard/card_home_component.dart';

class TituloHome extends StatefulWidget {
  const TituloHome({Key? key}) : super(key: key);

  @override
  State<TituloHome> createState() => _TituloHomeState();
}

class _TituloHomeState extends State<TituloHome> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Boletos'),
        CardHome(),
      ],
    );
  }
}
