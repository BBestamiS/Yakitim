import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:yatitimveritabani2/modeller/arac.dart';
import 'package:yatitimveritabani2/modeller/secim.dart';

class DBHelper {
  Secim secim = new Secim();
  Secim getSecimm() {
    return this.secim;
  }

  List<Secim> secimler = new List();
  List<Secim> getSecimlerr() {
    return this.secimler;
  }

  Arac arac = new Arac();
  Arac getAracc() {
    return this.arac;
  }

  List<Arac> araclar = new List();
  List<Arac> getAraclarr() {
    return this.araclar;
  }

  static Database _db;
  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDatabase();
    return _db;
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'arac.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE arac ( id INTEGER PRIMARY KEY AUTOINCREMENT, marka TEXT, model TEXT, plaka TEXT, kilometre INTEGER, yakittipi TEXT, depohacmi INTEGER, motorhacmi REAL, birinciyakitfiyat REAL, birinciyakitlitre REAL, birincikilometre REAL,ikinciyakitfiyat REAL, ikinciyakitlitre REAL, ikincikilometre REAL,ucuncuyakitfiyat REAL, ucuncuyakitlitre REAL, ucuncukilometre REAL,dorduncuyakitfiyat REAL, dorduncuyakitlitre REAL, dorduncukilometre REAL,besinciyakitfiyat REAL,besinciyakitlitre REAL, besincikilometre REAL, aylikyakit REAL, tarih INTEGER )");
    await db.execute(
        "CREATE TABLE secim (id INTEGER PRIMARY KEY AUTOINCREMENT, secim INTEGER )");
  }

  Future<Secim> secimEkle(Secim secim) async {
    var dbClient = await db;
    secim.id = await dbClient.insert('secim', secim.toMap());
    print("secim ekleme basarılı");
    return secim;
  }

  Future getSecimler() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.rawQuery("SELECT * FROM secim");
    List<Secim> secim = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        secim.add(Secim.fromMap(maps[i]));
      }
      this.secimler = secim;
    }
  }

  Future<int> getSeciml(int id) async {
    int secim;
    var dbClient = await db;
    List<Map> maps = await dbClient.rawQuery("SELECT * FROM secim");
    secim = Secim.fromMap(maps[id]).secim;
    return secim;
  }

  Future getSecim(int id) async {
    var dbClient = await db;
    List<Map> maps = await dbClient.rawQuery("SELECT * FROM secim");
    Secim secim = Secim.fromMap(maps[id]);
    this.secim = secim;
    print(secim.secim);
  }

  Future<Arac> aracEkle(Arac arac) async {
    var dbClient = await db;
    arac.id = await dbClient.insert('arac', arac.toMap());
    print("Arac ekleme başarılı");

    return arac;
  }

  Future<Arac> getAracll() async {
    var dbClient = await db;
    int secimSayi;
    List<Map> secimListe = await dbClient.rawQuery("SELECT * FROM secim");
    Secim secim = Secim.fromMap(secimListe[0]);
    secimSayi = secim.secim;
    List<Map> maps =
        await dbClient.rawQuery("SELECT * FROM arac WHERE id = ?", [secimSayi]);

    Arac arac = Arac.fromMap(maps[0]);
    return arac;
  }

  Future<Arac> getAracl(int id) async {
    var dbClient = await db;
    List<Map> maps =
        await dbClient.rawQuery("SELECT * FROM arac WHERE id = ?", [id]);

    Arac arac = Arac.fromMap(maps[0]);
    return arac;
  }

  Future getArac(int id) async {
    var dbClient = await db;
    List<Map> maps =
        await dbClient.rawQuery("SELECT * FROM arac WHERE id = ?", [id]);

    Arac arac = Arac.fromMap(maps[0]);
    this.arac = arac;
  }

  // Future<List<Arac>> getAraclar() async {
  //   var dbClient = await db;
  //   List<Map> maps = await dbClient.rawQuery("SELECT * FROM arac");
  //   List<Arac> araclar = [];
  //   if (maps.length > 0) {
  //     for (int i = 0; i < maps.length; i++) {
  //       araclar.add(Arac.fromMap(maps[i]));
  //     }
  //     return araclar;
  //   }
  // }
  Future getAraclar() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.rawQuery("SELECT * FROM arac");
    List<Arac> araclar = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        araclar.add(Arac.fromMap(maps[i]));
      }
      this.araclar = araclar;
    }
  }

  Future<void> sil(int id) async {
    var dbClient = await db;
    return await dbClient.delete(
      'arac',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> aracUpdate(Arac arac) async {
    var dbClient = await db;
    return await dbClient.update(
      'arac',
      arac.toMap(),
      where: 'id = ?',
      whereArgs: [arac.id],
    );
  }

  Future<int> secimUpdate(Secim secim) async {
    var dbClient = await db;
    return await dbClient.update(
      'secim',
      secim.toMap(),
      where: 'id = ?',
      whereArgs: [secim.id],
    );
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
