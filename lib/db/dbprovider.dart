import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:nabungskuy/model/kategoriModel.dart';
import 'dart:io';
import 'dart:async';

class NabungSKuyProvider {
  Future<Database> init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, 'nabungskuy.db');

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute("""
          CREATE TABLE kategori(
            idkategori INTEGERT PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            backroundColor TEXT,
            textColor TEXT
          )""");
    });
  }

  Future<int> addKategori(KategoriModel item) async {
    final db = await init();
    return db.insert("kategori", item.toMap(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }

  Future<List<KategoriModel>> fetchKategori() async {
    final db = await init();
    final maps = await db.query("kategori");

    return List.generate(maps.length,(i){
      return KategoriModel(
        idkategori: maps[i]['idkategori'],
        title: maps[i]['title'],
        backgroundColor: maps[i]['backgroundColor'],
        textColor: maps[i]['textColor']
      );
    });
  }

  Future<int> deleteKategori(int idkategori) async {
    final db = await init();

    int result = await db.delete(
      "kategori", where: "idkategori = ?", whereArgs: [idkategori]
    );
    return result;
  }

}
