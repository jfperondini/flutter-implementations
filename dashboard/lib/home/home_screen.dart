import 'package:dashboard/home/dashboard_home_components.dart';
import 'package:flutter/material.dart';
import 'package:dashboard/home/components/calendart_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
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
          child: CalendarWidget(),
        ),
      ])
    ]))));
  }
}
