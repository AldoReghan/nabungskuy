import 'package:sqflite/sqlite_api.dart';
import 'package:nabungskuy/model/kategoriModel.dart';
import 'dbprovider.dart';

class KategoriCrud {
  NabungskuyDB nabungskuyDB;

  insert(KategoriModel kategoriModel) async {
    Database db = await nabungskuyDB.database;
    int count = await db.insert('kategori', kategoriModel.toMap());
    return count;
  }

  update(KategoriModel kategoriModel) async {
    Database db = await nabungskuyDB.initDB();
    int count = await db.update('kategori', kategoriModel.toMap(),
        where: 'idkategori=?', whereArgs: [kategoriModel.idkategori]);
    return count;
  }

  delete(KategoriModel kategoriModel) async {
    Database db = await nabungskuyDB.database;
    int count = await db.delete('kategori',
        where: 'idkategori=?', whereArgs: [kategoriModel.idkategori]);
    return count;
  }

  Future<List<KategoriModel>> getKategoriList() async {
    final db = await nabungskuyDB.database;
    var res = await db.query("kategori");
    List<KategoriModel> list =
        res.isNotEmpty ? res.map((c) => KategoriModel.fromMap(c)).toList() : [];
    return list;
  }
}
