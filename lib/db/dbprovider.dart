import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';

class NabungskuyDB{
  Future<Database> initDb() async {
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

}
