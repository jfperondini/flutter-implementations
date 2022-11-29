import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared/modules/controller/collections_controller.dart';
import 'package:shared/shared/models/news_model.dart';
import 'package:shared/shared/models/strings.dart';
import 'package:shared/shared/widgets/news_widget.dart';

import 'package:shared/shared/widgets/search_bar_widget.dart';
import 'package:shared/shared/style/color.dart';

class SearchPageMobile extends StatelessWidget {
  final List<NewsModel> listNewsModel;

  SearchPageMobile({Key? key, required this.listNewsModel}) : super(key: key);

  final collectionController = Modular.get<CollectionController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchBarWidget(),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        TextButton(
                          onPressed: (() => Modular.to.pushNamed('/')),
                          child: const Text(
                            todasAsColecoes,
                            style: TextStyle(color: chumboEsczClr),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 7),
                    Text(
                        'Resultado da pesquisa:  ${collectionController.searchController.text}'),
                    ...listNewsModel.map((e) => NewsWidget(newsModel: e)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
