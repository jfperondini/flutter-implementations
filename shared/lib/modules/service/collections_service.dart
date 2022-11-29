import 'package:shared/api/client_interface.dart';
import 'package:shared/api/mocks/collection_json.dart';
import 'package:shared/shared/models/category_model.dart';

abstract class CollectionService {
  final IHttpClient collection;

  CollectionService(this.collection);

  Future<List<CategoryModel>> getListCategory();
}

class CollectionsServiceMock implements CollectionService {
  @override
  final IHttpClient collection;

  CollectionsServiceMock(this.collection);

  @override
  Future<List<CategoryModel>> getListCategory() async {
    final collection = collectionJsonMock["result"]?[0] as List;
    return collection.map((e) => CategoryModel.fromJson(e)).toList();
  }
}
