import 'package:flutter_app/repository/setting_repository.dart';
import 'package:flutter_app/setting.dart';

/// 設定画面のプレゼンター
class SettingPresenter {
  /// 設定リポジトリ
  SettingRepository repository;
  /// ビュー
  SettingView view;

  /// コンストラクター
  SettingPresenter(this.repository);

  /// ビューをセットする。
  setView(SettingView view) {
    this.view = view;
  }

  /// npcの人数を保存する。
  saveEndNpcId(int endNpcId) {
    repository.saveEndNpcId(endNpcId);
  }

  /// 設定データを読み込む。
  loadSettingData() async {
    int endNpcId = await repository.getEndNpcId();
    view.showEndNpcId(endNpcId);
  }
}

/// 設定画面のプレゼンターの製作者
class SettingPresenterMaker {
  /// 設定画面のプレゼンターのインスタンス
  static SettingPresenter _instance = SettingPresenter(SettingRepository());

  /// 設定画面のプレゼンタ－を作成する。
  static SettingPresenter make() {
    return _instance;
  }

  /// makeメソッドの返り値を差し替える。
  static makeThenReturn(SettingPresenter instance) {
    _instance = instance;
  }
}