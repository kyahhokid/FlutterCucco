import 'package:flutter_app/repository/db_helper.dart';
import 'package:sqflite/sqflite.dart';

/// 設定のリポジトリ。
class SettingRepository {
  /// テーブル名
  static const String SETTING_TABLE = 'SettingTable';

  /// インデックスのカラム名
  static const String INDEX = 'index';

  /// 値のカラム名
  static const String VALUE = 'value';

  /// npcの人数のインデックス名
  static const String END_NPC_ID = 'endNpcId';


  SettingRepository() {
    _createTable();
  }

  /// 設定のテーブルを生成する。
  _createTable() async {
    Database database = await DBHelper.openDb();
    await database.execute(
        'CREATE TABLE IF NOT EXISTS ? (? Text PRIMARY KEY, ? Text)',
        [SETTING_TABLE, INDEX, VALUE
        ]);
    await database.close();
  }

  /// npcの人数を保存する。
  ///
  /// 一度も保存したことがないならINSERTする。
  /// 保存したことがあるならUPDATEする。
  saveEndNpcId(int id) async {
    Database database = await DBHelper.openDb();
    List<Map> list = await database.rawQuery(
        'SELECT * FROM ? WHERE ? = ?', [SETTING_TABLE, INDEX, END_NPC_ID]);
    if (list.isEmpty) {
      await database.transaction((txn) async {
        await txn.rawInsert(
            'INSERT INTO ?(?, ?) VALUES(?, ?)',
            [SETTING_TABLE, INDEX, VALUE, END_NPC_ID, id.toString()]);
      });
    } else {
      await database.rawUpdate(
          'UPDATE ? SET ? = ? WHERE ? = ?',
          [SETTING_TABLE, VALUE, id.toString(), INDEX, END_NPC_ID]);
    }
    await database.close();
  }

  /// 保存されたnpcの人数を取り出す。
  ///
  /// 保存されていない場合は1を返す。
  Future<int> getEndNpcId() async {
    Database database = await DBHelper.openDb();
    List<Map> list = await database.rawQuery(
        'SELECT * FROM ? WHERE ? = ?', [SETTING_TABLE, INDEX, END_NPC_ID]);
    await database.close();
    switch (list.length) {
      case 0:
        return 1;
      case 1:
        return int.parse(list[0][END_NPC_ID]);
      default:
        return 0;
    }
  }
}