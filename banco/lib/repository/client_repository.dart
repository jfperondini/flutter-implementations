import 'package:banco/database/sqlite_db.dart';
import 'package:banco/models/cliente_models.dart';
import 'package:banco/repository/repository_hive.dart';

class ClientRepository extends RepositoryHive<ClientModel> {
  @override
  ClientModel convertJsonToModel(Map<String, dynamic> map) {
    return ClientModel.fromMap(map);
  }

  @override
  Map<String, dynamic> convertModelToJson(ClientModel model) {
    return model.toMap();
  }

  @override
  String getModelId(ClientModel model) {
    return model.id.toString();
  }

  @override
  //String get tableName => SqliteDB.instance.clientTableName;
  String get boxName => 'client';
}
