
import 'package:flutter_app/repository/setting_repository.dart';

import '../app.dart';

/// ククゲームマスター
class CuccoGameMaster {
  SettingRepository _repository;

  CuccoGameMaster(SettingRepository repository) {
    this._repository = repository;
  }

  /// ゲームのセットアップを行う。
  GameSetUp() {

  }

  /// ビューをセットする。
  setView(CuccoGameView view) {

  }
}