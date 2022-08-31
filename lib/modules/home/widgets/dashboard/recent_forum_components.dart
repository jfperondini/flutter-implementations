import 'package:my_api/modules/home/models/recent_user_model.dart';

import 'package:flutter/material.dart';

import 'package:my_api/style/colorful_tag.dart';

class RecentDiscussions extends StatelessWidget {
  const RecentDiscussions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Open Positions",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            child: DataTable(
              horizontalMargin: 0,
              columnSpacing: 16.0,
              columns: const [
                DataColumn(
                  label: Text("Nome do Cargo"),
                ),
                DataColumn(
                  label: Text("Criar data"),
                ),
                DataColumn(
                  label: Text("Total da Aplicação"),
                ),
              ],
              rows: List.generate(
                recentUsers.length,
                (index) => recentUserDataRow(recentUsers[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentUserDataRow(RecentUser userInfo) {
  return DataRow(
    cells: [
      DataCell(Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: getRoleColor(userInfo.role).withOpacity(.2),
            border: Border.all(color: getRoleColor(userInfo.role)),
            borderRadius: const BorderRadius.all(Radius.circular(5.0) //
                ),
          ),
          child: Text(userInfo.role!))),
      DataCell(Text(userInfo.date!)),
      DataCell(Text(userInfo.posts!)),
    ],
  );
}
