import 'package:flutter_app/repository/db_helper.dart';
import 'package:sqflite/sqflite.dart';

/// 設定のリポジトリ。
class SettingRepository {
  /// テーブル名
  static const String SETTING_TABLE = 'SettingTable';

  /// インデックスのカラム名
  static const String ITEM_NAME = 'itemName';

  /// 値のカラム名
  static const String VALUE = 'value';

  /// npcの人数のインデックス名
  static const String END_NPC_ID = 'endNpcId';

  /// DBの初期化が完了したか
  bool _isInitDatabase = false;


  SettingRepository() {
    _createTable();
  }

  /// 設定のテーブルを生成する。
  _createTable() async {
    Database database = await DBHelper.openDb();
    await database.transaction((txn) async {
      await txn.execute(
          'CREATE TABLE IF NOT EXISTS $SETTING_TABLE ( $ITEM_NAME TEXT, $VALUE TEXT)');
    });
    await database.close();
    _isInitDatabase = true;
  }

  /// npcの人数を保存する。
  ///
  /// 一度も保存したことがないならINSERTする。
  /// 保存したことがあるならUPDATEする。
  saveEndNpcId(int id) async {
    String idStr = id.toString();
    Database database = await getDB();
    List<Map> list = await database.rawQuery(
        'SELECT * FROM $SETTING_TABLE WHERE $ITEM_NAME = \'$END_NPC_ID\'');
    if (list.isEmpty) {
      await database.transaction((txn) async {
        await txn.rawInsert(
            'INSERT INTO $SETTING_TABLE($ITEM_NAME , $VALUE) VALUES(\'$END_NPC_ID\', \'$idStr\')');
      });
    } else {
      await database.rawUpdate(
          'UPDATE $SETTING_TABLE SET $VALUE = $idStr WHERE $ITEM_NAME = \'$END_NPC_ID\'');
    }
    await database.close();
  }

  /// 保存されたnpcの人数を取り出す。
  ///
  /// 保存されていない場合は1を返す。
  Future<int> getEndNpcId() async {
    Database database = await getDB();
    List<Map> list = await database.rawQuery('SELECT * FROM $SETTING_TABLE WHERE $ITEM_NAME = \'$END_NPC_ID\'');
    await database.close();
    switch (list.length) {
      case 1:
        return int.parse(list[0][VALUE]);
      default:
        return 1;
    }
  }

  /// DBを取得する。
  ///
  /// DBの初期化が完了するまで待機してから、DBを返す。
  Future<Database> getDB() async {
    while(!_isInitDatabase) {
      await new Future.delayed(new Duration(milliseconds: 100));
    }
    return DBHelper.openDb();
  }
}