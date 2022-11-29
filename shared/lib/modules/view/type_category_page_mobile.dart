import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shared/modules/controller/collections_controller.dart';
import 'package:shared/shared/models/category_model.dart';
import 'package:shared/shared/models/strings.dart';
import 'package:shared/shared/widgets/news_widget.dart';
import 'package:shared/shared/widgets/search_bar_widget.dart';
import 'package:shared/shared/style/color.dart';

class TypeCategoryPageMobile extends StatelessWidget {
  final CategoryModel categoryModel;

  TypeCategoryPageMobile({super.key, required this.categoryModel});
  final collectionController = Modular.get<CollectionController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: collectionController,
        builder: (context, child) => Column(
          children: [
            SearchBarWidget(),
            SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      TextButton(
                          onPressed: (() => Modular.to.pushNamed('/')),
                          child: const Text(
                            todasAsColecoes,
                            style: TextStyle(color: chumboEsczClr),
                          )),
                      Text('> ${categoryModel.typeCategory}'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(MdiIcons.fromString(
                                categoryModel.iconCategory)),
                            const SizedBox(width: 20),
                            Text(categoryModel.typeCategory),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ...categoryModel.news.map((e) => NewsWidget(newsModel: e))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
