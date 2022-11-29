import 'package:flutter/material.dart';
import 'package:shared/shared/widgets/category_widget.dart';
import 'package:shared/shared/models/category_model.dart';
import 'package:shared/shared/widgets/search_bar_widget.dart';

class CollectionPageMobile extends StatelessWidget {
  final List<CategoryModel> categoryModel;
  const CollectionPageMobile({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SearchBarWidget(),
          ...categoryModel.map(
            (e) => CategoryWidget(categoryModel: e),
          ),
        ],
      ),
    );
  }
}
