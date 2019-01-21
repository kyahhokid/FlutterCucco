import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Database _db;

  static Future<Database> get db async {
    if (_db != null) return _db;
    _db = await _initDb();
    return _db;
  }

  static _initDb() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');
    var db = await openDatabase(path, version: 1);
    return db;
  }

  static _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE messages(messageId TEXT　PRIMARY KEY, userId TEXT, groupId TEXT, message TEXT, createdAt TEXT)"
    );
  }
}