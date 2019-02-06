import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/// データベースヘルパー
class DBHelper {
  /// テスト中か
   static bool _isTesting = false;

   /// データベースを開く
   /// テスト中ならば、テスト用のデータベースを開く
   static Future<Database> openDb() async {
     String dbName = _isTesting ? 'cuccoTest.db': 'cucco.db';
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, dbName);
    Database db = await openDatabase(path, version: 1);
    return db;
  }

   /// テスト中かをセットする。
   static setIsTesting (bool isTesting) {
     _isTesting = isTesting;
   }

}