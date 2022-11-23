import 'package:banco/repository/repository.dart';
import 'package:sqflite/sqlite_api.dart';

import '../database/sqlite_db.dart';

abstract class RepositorySqflite<Model> extends Repository<Model> {
  Database? get db => SqliteDB.instance.database;

  String get tableName;
  @override
  Future<List<Model>> getAll() async {
    List<Map<String, dynamic>> list = await db!.query(tableName);
    return convertJsonToModels(list);
  }

  @override
  Future<Model?> get(String id) async {
    List<Map<String, dynamic>> list =
        await db!.query(tableName, where: 'id=?', whereArgs: [id]);
    List<Model> models = convertJsonToModels(list);
    if (models.isEmpty) return null;
    return models.first;
  }

  @override
  Future<int> insert(Model model) async {
    return await db!.insert(tableName, convertModelToJson(model));
  }

  @override
  Future<int> delete(Model model) async {
    return await db!
        .delete(tableName, where: 'id=?', whereArgs: [getModelId(model)]);
  }

  @override
  Future<int> update(Model model) async {
    return await db!.update(tableName, convertModelToJson(model),
        where: 'id=?', whereArgs: [getModelId(model)]);
  }
}
