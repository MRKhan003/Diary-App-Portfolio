import 'package:sqflite/sqflite.dart';

class CRUD {
  static const dbName = "myDatabase.db";
  static const dbVersion = 1;
  static const dbTable = 'clientDetails';
  static const columnId = "id";
  static var columnName = "name";
  static var columnUserID = "userID";
  static var columnPassword = "password";
  static var columnPin = "pin";

  static final CRUD instance = CRUD();
  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = await getDatabasesPath();
    return await openDatabase(
      path,
      version: 1,
      onCreate: onCreate,
    );
  }

  Future onCreate(Database db, int version) async {
    db.execute('''

CREATE TABLE $dbTable(
  $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
  $columnName TEXT NOT NULL,
  $columnUserID TEXT NOT NULL,
  $columnPassword TEXT NOT NULL,
  $columnPin INTEGER NOT NULL,
)
''');
  }

  insertData(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    print(db.insert(dbTable, row));
    return await db.insert(dbTable, row);
  }

  Future<List<Map<String, dynamic>>> queryByName(String name) async {
    Database db = await instance.database;
    return await db
        .query('clientDetails', where: 'columnName = ?', whereArgs: [name]);
  }

  Future<int> updateRecord(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnUserID];
    return await db
        .update(dbTable, row, where: '$columnUserID=?', whereArgs: [id]);
  }

  Future<int> deleteRecord(int id) async {
    Database db = await instance.database;
    return await db.delete(dbTable, where: '$columnUserID=?', whereArgs: [id]);
  }
}
