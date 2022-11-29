import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shared/shared/models/category_model.dart';
import 'package:shared/shared/style/color.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryModel categoryModel;

  const CategoryWidget({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: geloClr,
      child: Card(
        elevation: 3,
        shadowColor: chumboEsczClr,
        margin: const EdgeInsets.all(25),
        child: Column(
          children: [
            const SizedBox(height: 20),
            ListTile(
              leading: Icon(MdiIcons.fromString(categoryModel.iconCategory)),
              title: Text(categoryModel.typeCategory),
              subtitle: Text(categoryModel.titleCategory),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () => Modular.to
                  .pushNamed('/typecategory', arguments: categoryModel),
            ),
            const SizedBox(height: 10),
            Text(
                '${categoryModel.news.length.toString()} artigos nesta coleção'),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
