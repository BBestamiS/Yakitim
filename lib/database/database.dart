import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:yakitim/modeller/arac.dart';
import 'package:yakitim/modeller/secim.dart';

class DBHelper {
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
        "CREATE TABLE arac ( id INTEGER PRIMARY KEY AUTOINCREMENT, marka TEXT, model TEXT, plaka TEXT, kilometre INTEGER, yakittipi TEXT, depohacmi INTEGER, motorhacmi REAL, birinciyakitfiyat REAL, birinciyakitlitre REAL, birincikilometre INTEGER,ikinciyakitfiyat REAL, ikinciyakitlitre REAL, ikincikilometre INTEGER,ucuncuyakitfiyat REAL, ucuncuyakitlitre REAL, ucuncukilometre INTEGER,dorduncuyakitfiyat REAL, dorduncuyakitlitre REAL, dorduncukilometre INTEGER,besinciyakitfiyat REAL,besinciyakitlitre REAL, besincikilometre INTEGER, aylikyakit REAL, tarih INTEGER , toplamlira REAL, toplamlitre REAL, sonkilometre INTEGER)");
    await db.execute(
        "CREATE TABLE secim (id INTEGER PRIMARY KEY AUTOINCREMENT, secim INTEGER )");
  }

  Future<int> ekranSecimi() async {
    var dbClient = await db;
    double yakit;
    int secim;
    List<Map> ekranSecim = await dbClient.rawQuery("SELECT * FROM arac");

    if (ekranSecim.isEmpty) {
      return 0;
    } else {
      List<Map> secimList = await dbClient.rawQuery("SELECT * FROM secim");
      secim = Secim.fromMap(secimList[0]).secim;
      List<Map> aracList =
          await dbClient.rawQuery("SELECT * FROM arac WHERE id = ?", [secim]);
      yakit = Arac.fromMap(aracList[0]).besinciyakitlitre;
      if (yakit == null) {
        return 1;
      } else {
        return 2;
      }
    }
  }

  Future<Secim> secimEkle(Secim secim) async {
    var dbClient = await db;
    secim.id = await dbClient.insert('secim', secim.toMap());
    print("secim ekleme basarılı");
    return secim;
  }

  Future<Secim> getSecim() async {
    var dbClient = await db;
    Secim secim;
    List<Map> secimListe = await dbClient.rawQuery("SELECT * FROM secim");
    secim = Secim.fromMap(secimListe[0]);
    return secim;
  }

  Future<Arac> aracEkle(Arac arac) async {
    var dbClient = await db;
    arac.id = await dbClient.insert('arac', arac.toMap());
    print("Arac ekleme başarılı");
    return arac;
  }

  Future<Arac> getArac() async {
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

  Future<List<Arac>> getAraclar() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.rawQuery("SELECT * FROM arac");
    List<Arac> araclar = [];
    for (int i = 0; i < maps.length; i++) {
      araclar.add(Arac.fromMap(maps[i]));
    }
    return araclar;
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
    print("seçim güncellendi");
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
