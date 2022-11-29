import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared/shared/models/news_model.dart';
import 'package:shared/shared/models/strings.dart';
import 'package:shared/shared/widgets/news_paragraph_widget.dart';
import 'package:shared/shared/widgets/search_bar_widget.dart';
import 'package:shared/shared/style/color.dart';

class NewPageMobile extends StatelessWidget {
  final NewsModel newsModel;

  const NewPageMobile({super.key, required this.newsModel});

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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(newsModel.title),
                            ],
                          ),
                          Row(
                            children: [
                              Text(newsModel.subtitle),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    ...newsModel.newsParagraphs
                        .map((e) => NewsParagraphWidget(newsParagraphModel: e))
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
