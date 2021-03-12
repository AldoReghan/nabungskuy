import 'package:nabungskuy/model/kategoriModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';

class NabungskuyDB{

  NabungskuyDB._();

  static final NabungskuyDB db = NabungskuyDB._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'nabungskuy.db';
    var nabungSkuyDB = openDatabase(path, version: 1, onCreate: _createDb);
    return nabungSkuyDB;
  }

  void _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE kategori (
        idkategori INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        backgroundColor TEXT,
        textColor TEXT
      )
    ''');
  }

  insert(KategoriModel kategoriModel) async {
    Database db = await database;
    int count = await db.insert('kategori', kategoriModel.toMap());
    return count;
  }

  update(KategoriModel kategoriModel) async {
    Database db = await database;
    int count = await db.update('kategori', kategoriModel.toMap(),
        where: 'idkategori=?', whereArgs: [kategoriModel.idkategori]);
    return count;
  }

  delete(int id) async {
    Database db = await database;
    return await db.delete('kategori',
        where: 'idkategori=?', whereArgs: [id]);
  }

  deleteClient(int id) async {
    final db = await database;
    return db.delete("Client", where: "id = ?", whereArgs: [id]);
  }

  Future<List<KategoriModel>> getKategoriList() async {
    final db = await database;
    var res = await db.query("kategori");
    List<KategoriModel> list =
        res.isNotEmpty ? res.map((c) => KategoriModel.fromMap(c)).toList() : [];
    return list;
  }

}
