abstract class Repository<Model> {
  List<Model> convertJsonToModels(List<Map<String, dynamic>> list) {
    return list.map((e) => convertJsonToModel(e)).toList();
  }

  Model convertJsonToModel(Map<String, dynamic> map);

  Map<String, dynamic> convertModelToJson(Model model);

  String getModelId(Model model);

  Future<List<Model>> getAll();

  Future<Model?> get(String id);

  Future<int> insert(Model model);

  Future<int> delete(Model model);

  Future<int> update(Model model);
}
