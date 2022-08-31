import 'package:my_api/database/hive_db.dart';

import 'package:hive/hive.dart';
import 'package:my_api/database/repository/repository.dart';



abstract class RepositoryHive<Model> extends Repository<Model> {
  Future<Box<Map<String, dynamic>>> getBox() => HiveDB.instance.getBox(boxName);

  String get boxName;

  @override
  Future<List<Model>> getAll() async {
    var box = await getBox();
    List<Map<String, dynamic>> list = box.values.toList();
    return convertJsonToModels(list);
  }

  @override
  Future<Model?> get(String id) async {
    var box = await getBox();
    Map<String, dynamic>? result = box.get(id);
    if (result == null) return null;
    return convertJsonToModel(result);
  }

  @override
  Future<int> insert(Model model) async {
    var box = await getBox();
    box.put(getModelId(model), convertModelToJson(model));
    return 1;
  }

  @override
  Future<int> delete(Model model) async {
    var box = await getBox();
    box.delete(getModelId(model));
    return 1;
  }

  @override
  Future<int> update(Model model) async {
    await delete(model);
    await insert(model);
    return 1;
  }
}
