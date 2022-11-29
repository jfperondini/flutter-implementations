import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared/shared/config/responsive_widget.dart';
import 'package:shared/modules/controller/collections_controller.dart';
import 'package:shared/modules/view/search_page_mobile.dart';

class SearchPagePresenter extends StatefulWidget {
  const SearchPagePresenter({super.key});

  @override
  State<SearchPagePresenter> createState() => _SearchPagePresenterState();
}

class _SearchPagePresenterState extends State<SearchPagePresenter> {
  final collectionController = Modular.get<CollectionController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      collectionController.searchNews;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: collectionController,
      builder: (context, child) {
        return ResponsiveWidget(
            buildMobile: (context) => SearchPageMobile(
                listNewsModel: collectionController.listNewsSearched),
            buildTablet: (context) => SearchPageMobile(
                listNewsModel: collectionController.listNewsSearched),
            buildDesktop: (context) => SearchPageMobile(
                listNewsModel: collectionController.listNewsSearched));
      },
    );
  }
}
