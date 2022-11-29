import 'package:shared/shared/models/news_model.dart';

class CategoryModel {
  final String idCategory;
  final String typeCategory;
  final String iconCategory;
  final String titleCategory;
  List<NewsModel> news;

  CategoryModel({
    required this.idCategory,
    required this.typeCategory,
    required this.iconCategory,
    required this.titleCategory,
    required this.news,
  });

  static CategoryModel fromJson(Map<String, dynamic> map) {
    return CategoryModel(
      idCategory: map['idCategory'],
      typeCategory: map['typeCategory'],
      iconCategory: map['iconCategory'],
      titleCategory: map['titleCategory'],
      news: (map['news'] as List).map((e) => NewsModel.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'idCategory': idCategory,
      'typeCategory': typeCategory,
      'iconCategory': iconCategory,
      'titleCategory': titleCategory,
    };
  }

  bool isSearchValid(String query) {
    if (titleCategory.toLowerCase().contains(query.toLowerCase())) return true;
    if (typeCategory.toLowerCase().contains(query.toLowerCase())) return true;
    for (NewsModel newsModel in news) {
      if (newsModel.isSearchValid(query)) return true;
    }
    return false;
  }
}
