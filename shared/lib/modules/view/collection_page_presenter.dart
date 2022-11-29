import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared/shared/config/responsive_widget.dart';
import 'package:shared/modules/controller/collections_controller.dart';
import 'package:shared/modules/view/collections_page_mobile.dart';

class CollectionPagePresenter extends StatefulWidget {
  const CollectionPagePresenter({super.key});

  @override
  State<CollectionPagePresenter> createState() =>
      _CollectionPagePresenterState();
}

class _CollectionPagePresenterState extends State<CollectionPagePresenter> {
  final collectionController = Modular.get<CollectionController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      collectionController.getCategory();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: collectionController,
      builder: (context, child) {
        return ResponsiveWidget(
          buildMobile: (context) => CollectionPageMobile(
              categoryModel: collectionController.listCategory),
          buildTablet: (context) => CollectionPageMobile(
              categoryModel: collectionController.listCategory),
          buildDesktop: (context) => CollectionPageMobile(
              categoryModel: collectionController.listCategory),
        );
      },
    );
  }
}
