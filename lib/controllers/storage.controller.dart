import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:test_aspirante_flutter/stores/database/profile.database.dart';
import 'package:test_aspirante_flutter/stores/database/user.database.dart';

class StorageController {

  Database database;
  static const String DATABASE_NAME = 'test_aspirante.db';
  static const int VERSION = 1;


  Future<void> initDB() async {
    print('initDB');
    final Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final String path = join(documentsDirectory.path, DATABASE_NAME);
    print(path);
    database = await openDatabase(path, version: VERSION, onCreate: _onCreate);
  }


  Future<void> _onCreate(Database db, int version) async {
    await db.execute(UserDatabase.table);
    await db.execute(ProfileDatabase.table);
  }

  void insert(String table, Map<String, Object> data){
    database.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace,);
  }


}