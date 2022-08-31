import 'package:flutter/material.dart';
import 'package:my_api/modules/home/widgets/dashboard/build_card_component.dart';

class CardHome extends StatefulWidget {
  const CardHome({Key? key}) : super(key: key);

  @override
  State<CardHome> createState() => _CardHomeState();
}

class _CardHomeState extends State<CardHome> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: size.height * 0.01, horizontal: size.width * 0.01),
      child: Row(
        children: [
          buildCard('title', 'subtitle', Colors.blue),
          buildCard('title', 'subtitle', Colors.red),
        ],
      ),
    );
  }
}
