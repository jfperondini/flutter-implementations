import 'package:flutter/material.dart';

import 'package:shared/modules/service/collections_service.dart';
import 'package:shared/shared/models/category_model.dart';
import 'package:shared/shared/models/news_model.dart';

class CollectionController with ChangeNotifier {
  final CollectionService _service;

  List<CategoryModel> listCategory = [];
  List<CategoryModel> listCategorySearched = [];

  List<NewsModel> listNewsSearched = [];

  TextEditingController searchController = TextEditingController();

  CollectionController(
    this._service,
  );

  Future<void> getCategory() async {
    listCategory = await _service.getListCategory();
    notifyListeners();
  }

  List<NewsModel> searchNews(String query) {
    List<NewsModel> listNews = [];
    listCategory.forEach((element) {
      element.news.forEach((element) {
        final newsValue = element.isSearchValid(query);
        if (newsValue) {
          listNews.add(element);
        }
      });
    });
    return listNewsSearched = listNews;
  }

  // Future<void> search(String query) async {
  //   var list = listCategory.where((category) {
  //     return category.isSearchValid(query);
  //   }).toList();
  //   listCategorySearched = list;
  //   notifyListeners();
  // }
}
