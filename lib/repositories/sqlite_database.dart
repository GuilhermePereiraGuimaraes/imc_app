import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

Map<int, String> scripts = {
  1: '''CREATE TABLE imc(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        peso REAL,
        altura REAL,
        resultado TEXT
        )
  '''
};

class SqliteDatabase {
  static Database? db;

  Future<Database> getDatabase() async {
    if (db == null) {
      return await iniciarBancoDeDados();
    }
    return db!;
  }

  Future<Database> iniciarBancoDeDados() async {
    var db = await openDatabase(
      path.join(await getDatabasesPath(), 'database.db'),
      version: scripts.length,
      onCreate: (db, version) async {
        for (var i = 1; i <= scripts.length; i++) {
          await db.execute(scripts[i]!);
        }
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        for (var i = oldVersion + 1; i <= scripts.length; i++) {
          await db.execute(scripts[i]!);
        }
      },
    );
    return db;
  }
}
