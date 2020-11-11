import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:yakitim/modeller/arac.dart';

class DbHelper {
  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
    var dbFolder = await getDatabasesPath();
    String path = join(dbFolder, "Arac.db");

    return await openDatabase(path, onCreate: _onCreate, version: 1);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE Araclar(id INTEGER PRIMARY KEY AUTOINCREMENT, marka TEXT,model TEXT,plaka TEXT,yakitTipi TEXT, depoHacmi INTEGER,motorHacmi REAL,kilometre INTEGER)");
  }

  Future<List<Arac>> getAraclar() async {
    var dbClint = await db;
    var result = await dbClint.query("Araclar", orderBy: "marka");
    return result.map((data) => Arac.fromMap(data)).toList();
  }
}

// class DatabaseHelper {
//   static const _databaseName = "AracData.db";
//   static const _databaseVersion = 1;

//   DatabaseHelper._();
//   static final DatabaseHelper instance = DatabaseHelper._();

//   Database _database;
//   Future<Database> get database async {
//     if (_database != null) return _database;
//     _database = await _initDatabase();
//     return _database;
//   }

//   _initDatabase() async {
//     Directory dataDirectory = await getApplicationSupportDirectory();
//     String dbPath = join(dataDirectory.path, _databaseName);
//     return await openDatabase(dbPath,
//         version: _databaseVersion, onCreate: _onCreateDB);
//   }

//   _onCreateDB(Database db, int version) async {
//     await db.execute('''
//       CREATE TABLE ${Arac.tblArac}(
//         ${Arac.colId} INTEGER PRIMARY KEY AUTOINCREMENT,
//         ${Arac.colMarka} TEXT NOT NULL,
//         ${Arac.colModel} TEXT NOT NULL,
//         ${Arac.colPlaka} TEXT NOT NULL,
//         ${Arac.colYakitTipi} TEXT NOT NULL,
//         ${Arac.colDepoHacmi} INTEGER NOT NULL,
//         ${Arac.colMotorHacmi} REAL NOT NULL,
//         ${Arac.colKilometre} INTEGER NOT NULL
//       )
//     ''');
//   }

//   Future<int> insertArac(Arac arac) async {
//     print("eklendi");
//     Database db = await database;
//     return await db.insert(Arac.tblArac, arac.toMap());
//   }

//   Future<List<Arac>> fetchAraclar() async {
//     Database db = await database;
//     List<Map> araclar = await db.query(Arac.tblArac);
//     return araclar.length == 0
//         ? []
//         : araclar.map((e) => Arac.fromMap(e)).toList();
//   }
// }
