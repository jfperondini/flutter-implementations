import 'package:my_api/database/repository/repository_hive.dart';
import 'package:my_api/modules/agenda/models/agenda_model.dart';

class ClientRepository extends RepositoryHive<AgendaModel> {
  @override
  AgendaModel convertJsonToModel(Map<String, dynamic> map) {
    return AgendaModel.fromJson(map);
  }

  @override
  Map<String, dynamic> convertModelToJson(AgendaModel model) {
    return model.toJson();
  }

  @override
  String getModelId(AgendaModel model) {
    return model.idAgenda.toString();
  }

  @override
  //String get tableName => SqliteDB.instance.clientTableName;
  String get boxName => 'agenda';
}
