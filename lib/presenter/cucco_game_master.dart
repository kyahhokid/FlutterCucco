
import 'package:flutter_app/repository/setting_repository.dart';

import '../app.dart';

/// ククゲームマスター
class CuccoGameMaster {
  // ビュー
  CuccoGameView view;
  // 設定リポジトリ
  SettingRepository _repository;
  
  /// コンストラクタ
  CuccoGameMaster(SettingRepository repository) {
    this._repository = repository;
  }

  /// ゲームのセットアップを行う。
  GameSetUp() async {
    int endNpcId = await _repository.getEndNpcId();
    view.setEndNpcId(endNpcId);
  }

  /// ビューをセットする。
  setView(CuccoGameView view) {
    this.view = view;
  }
}

/// ゲームマスターの作成者
class CuccoGameMasterMaker {
  /// ゲームマスターのインスタンス
  static CuccoGameMaster _instance = CuccoGameMaster(SettingRepository());

  /// ゲームマスターを作成する。
  static CuccoGameMaster make() {
    return _instance;
  }

  /// makeメソッドの返り値を差し替える。
  static makeThenReturn(CuccoGameMaster instance) {
    _instance = instance;
  }
}