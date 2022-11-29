import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared/shared/models/news_model.dart';
import 'package:shared/shared/style/color.dart';

class NewsWidget extends StatelessWidget {
  final NewsModel newsModel;

  const NewsWidget({super.key, required this.newsModel});

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
              title: Text(newsModel.title),
              subtitle: Text(newsModel.subtitle),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () => Modular.to.pushNamed('/new', arguments: newsModel),
            ),
          ],
        ),
      ),
    );
  }
}
