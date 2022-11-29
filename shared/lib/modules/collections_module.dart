import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared/modules/controller/collections_controller.dart';
import 'package:shared/modules/service/collections_service.dart';
import 'package:shared/modules/view/new_page_mobile.dart';
import 'package:shared/modules/view/collection_page_presenter.dart';
import 'package:shared/modules/view/search_page_presenter.dart';
import 'view/type_category_page_mobile.dart';

class CollectionsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => CollectionsServiceMock(i())),
    Bind.lazySingleton((i) => CollectionController(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const CollectionPagePresenter()),
    ChildRoute('/typecategory',
        child: (_, args) => TypeCategoryPageMobile(categoryModel: args.data)),
    ChildRoute('/new', child: (_, args) => NewPageMobile(newsModel: args.data)),
    ChildRoute('/search', child: (_, args) => const SearchPagePresenter()),
  ];
}
