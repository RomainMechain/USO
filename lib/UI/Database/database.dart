import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Instance de la base de données
  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();
    return _database;
  }

  // Initialisation de la base de données
  _initDatabase() async {
    String path = join(await getDatabasesPath(), "database.db");
    return await openDatabase(path,
        version: 1, onCreate: _onCreate);
  }

  // Création de la table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE SCORE (
        id INTEGER PRIMARY KEY,
        nom TEXT NOT NULL,
        score INTEGER NOT NULL,
        niveau TEXT NOT NULL
      )
      ''');
  }

  // Insérer une nouvelle entrée dans la table
  Future<int> insert(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db!.insert("SCORE", row);
  }

  // Obtenir toutes les entrées de la table
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database? db = await instance.database;
    return await db!.query("SCORE");
  }
  Future<void> resetDatabase() async {
    Database? db = await instance.database;
    await db!.execute('DROP TABLE IF EXISTS SCORE');
    await _onCreate(db, 1);
  }
}
