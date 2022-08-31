import 'package:my_api/modules/home/models/recent_user_model.dart';


import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:flutter/material.dart';
import 'package:my_api/style/colorful_tag.dart';
import 'package:my_api/style/colors.dart';

class RecentUsers extends StatelessWidget {
  const RecentUsers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Clientes",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: DataTable(
                horizontalMargin: 0,
                columnSpacing: 16.0,
                columns: const [
                  DataColumn(
                    label: Text("Nome"),
                  ),
                  DataColumn(
                    label: Text("CNPJ"),
                  ),
                  DataColumn(
                    label: Text("E-mail"),
                  ),
                  DataColumn(
                    label: Text("Data de Registro"),
                  ),
                  DataColumn(
                    label: Text("Status"),
                  ),
                  DataColumn(
                    label: Text("Operação"),
                  ),
                ],
                rows: List.generate(
                  recentUsers.length,
                  (index) => recentUserDataRow(recentUsers[index], context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentUserDataRow(RecentUser userInfo, BuildContext context) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            TextAvatar(
              size: 35,
              backgroundColor: Colors.white,
              textColor: Colors.white,
              fontSize: 14,
              upperCase: true,
              numberLetters: 1,
              shape: Shape.Rectangle,
              text: userInfo.name!,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                userInfo.name!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      DataCell(Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: getRoleColor(userInfo.role).withOpacity(.2),
            borderRadius: const BorderRadius.all(Radius.circular(1) //
                ),
          ),
          child: Text(userInfo.role!))),
      DataCell(Text(userInfo.email!)),
      DataCell(Text(userInfo.date!)),
      DataCell(Text(userInfo.posts!)),
      DataCell(
        Row(
          children: [
            TextButton(
              child: const Text('View', style: TextStyle(color: greenColor)),
              onPressed: () {},
            ),
          ],
        ),
      ),
    ],
  );
}
