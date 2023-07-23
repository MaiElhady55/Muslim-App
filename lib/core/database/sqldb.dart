import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await intialDb();
      return _db;
    } else {
      return _db;
    }
  }

  Future<Database> intialDb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'mai.db');

    Database myDB = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
    return myDB;
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE Contact ("id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "note" TEXT NOT NULL )');
  }

  Future<List<Map<String, Object?>>?>? readData(
      {required String tableName}) async {
    Database? myDB = await db;
    List<Map<String, Object?>>? data = await myDB?.query(tableName);
    return data;
  }

  Future<int> insertData(
      {required String table, required Map<String, Object?> values}) async {
    Database? myDB = await db;
    int data = await myDB!.insert(table, values);
    return data;
  }

  Future<int> updateData(sql) async {
    Database? myDB = await db;
    int data = await myDB!.rawUpdate(sql);
    return data;
  }

  Future<int> deleteData(sql) async {
    Database? myDB = await db;
    int data = await myDB!.rawDelete(sql);
    return data;
  }
}
