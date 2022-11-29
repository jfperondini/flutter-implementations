import 'package:flutter/material.dart';
import 'package:shared/shared/models/news_paragraph_model.dart';

class NewsParagraphWidget extends StatelessWidget {
  final NewsParagraphModel newsParagraphModel;
  const NewsParagraphWidget({super.key, required this.newsParagraphModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ...newsParagraphModel.texts.map((e) => Text(e)),
          const SizedBox(height: 8),
          ...newsParagraphModel.images.map((e) => Image.asset(e)),
          const SizedBox(height: 8),
          ...newsParagraphModel.gifs.map((e) => Image.asset(e)),
        ],
      ),
    );
  }
}
