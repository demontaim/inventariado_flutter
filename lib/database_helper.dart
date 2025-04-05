import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('inventario.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';

    await db.execute('''
      CREATE TABLE equipos (
        id $idType, 
        nombre $textType,
        usuario_asignado $textType,
        ubicacion $textType,
        estado $textType,
        historial_mantenimiento $textType,
        incidencias $textType
      )
    ''');
  }

  Future<int> insertEquipo(Map<String, dynamic> row) async {
    final db = await instance.database;
    return await db.insert('equipos', row);
  }

  Future<List<Map<String, dynamic>>> queryAllEquipos() async {
    final db = await instance.database;
    return await db.query('equipos');
  }

  Future<int> deleteEquipo(int id) async {
    final db = await instance.database;
    return await db.delete('equipos', where: 'id = ?', whereArgs: [id]);
  }
}
