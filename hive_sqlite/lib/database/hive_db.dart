import 'package:hive/hive.dart';
import 'package:path/path.dart';

//sqflite
class HiveDB {
  // Contrutor com acesso privado
  HiveDB._();
  static HiveDB? _instance;
  // Criar uma instancia de DB
  static HiveDB get instance => _instance ??= HiveDB._();

  Map<String, Box<Map<String, dynamic>>> boxes = {};

  Future<Box<Map<String, dynamic>>> getBox(String boxName) async {
    if (boxes.containsKey(boxName)) return boxes[boxName]!;
    Box<Map<String, dynamic>> box = await Hive.openBox(boxName);
    boxes[boxName] = box;
    return box;
  }
}
