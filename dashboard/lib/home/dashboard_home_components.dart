import 'package:dashboard/home/dashboard/bar_grafico_components.dart';
import 'package:dashboard/home/dashboard/recent_users.dart';
import 'package:dashboard/home/dashboard/titulo_home_component.dart';
import 'package:flutter/material.dart';

class DashboardHome extends StatelessWidget {
  const DashboardHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: size.height * 0.02, horizontal: size.width * 0.02),
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width * 0.2,
                  child: const TituloHome(),
                ),
                SizedBox(
                  width: size.width * 0.4,
                  child: const BarGraficoComponent(),
                ),
              ],
            ),
            const RecentUsers(),
          ],
        ),
      ),
    );
  }
}
