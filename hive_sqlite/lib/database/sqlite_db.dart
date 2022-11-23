import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

//sqflite
class SqliteDB {
  // Contrutor com acesso privado
  SqliteDB._();
  static SqliteDB? _instance;
  // Criar uma instancia de DB
  static SqliteDB get instance => _instance ??= SqliteDB._();
  // Instancia do SQLite
  static Database? _database;

  get database async {
    if (_database != null) return _database;
    return await _initDatabase();
  }

  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'my_api.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(db, version) async {
    await db.execute(_sqlCreateTableClient);
  }

  String get clientTableName => 'client';

  String get _sqlCreateTableClient => '''
        CREATE TABLE $clientTableName (
          id INTEGER PRIMARY KEY AUTOINCREMENTE, 
          nome STRING 
        );
   ''';
}
