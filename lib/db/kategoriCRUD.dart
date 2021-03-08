import 'package:sqflite/sqlite_api.dart';
import 'package:nabungskuy/model/kategoriModel.dart';
import 'dbprovider.dart';

class KategoriCrud {
  NabungskuyDB nabungskuyDB = NabungskuyDB();

  Future<int> insert(KategoriModel kategoriModel) async {
    Database db = await nabungskuyDB.initDb();
    int count = await db.insert('kategori', kategoriModel.toMap());
    return count;
  }

  Future<int> update(KategoriModel kategoriModel) async {
    Database db = await nabungskuyDB.initDb();
    int count = await db.update('kategori', kategoriModel.toMap(),
        where: 'idkategori=?', whereArgs: [kategoriModel.idkategori]);
    return count;
  }

  Future<int> delete(KategoriModel kategoriModel) async {
    Database db = await nabungskuyDB.initDb();
    int count = await db.delete('kategori',
        where: 'idkategori=?', whereArgs: [kategoriModel.idkategori]);
    return count;
  }

  Future<List<KategoriModel>> getKategoriList() async{
    Database db= await nabungskuyDB.initDb();
  }
}
