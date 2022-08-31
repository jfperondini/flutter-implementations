import 'package:flutter/material.dart';
import 'package:my_api/config/size_config.dart';
import 'package:my_api/modules/home/widgets/dashboard/bar_grafico_components.dart';
import 'package:my_api/modules/home/widgets/dashboard/recent_users.dart';
import 'package:my_api/modules/home/widgets/dashboard/titulo_home_component.dart';

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
            SizedBox(height: SizeConfig(context).blockSizeVertical * 2),
            const RecentUsers(),
          ],
        ),
      ),
    );
  }
}
