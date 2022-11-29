import 'package:shared/shared/models/news_paragraph_model.dart';

class NewsModel {
  final String idNews;
  final String title;
  final String subtitle;
  List<NewsParagraphModel> newsParagraphs;

  NewsModel({
    required this.idNews,
    required this.title,
    required this.subtitle,
    required this.newsParagraphs,
  });

  static NewsModel fromJson(Map<String, dynamic> map) {
    return NewsModel(
      idNews: map['idNews'],
      title: map['title'],
      subtitle: map['subtitle'],
      newsParagraphs: (map['body'] as List)
          .map((e) => NewsParagraphModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'idNew': idNews,
      'title': title,
      'subtitle': subtitle,
    };
  }

  bool isSearchValid(String query) {
    if (title.toLowerCase().contains(query.toLowerCase())) return true;
    if (subtitle.toLowerCase().contains(query.toLowerCase())) return true;
    // for (NewsParagraphModel newsParagraphModel in newsParagraphs) {
    //   if (newsParagraphModel.isSearchValid(query)) return true;
    // }
    return false;
  }
}
