import 'package:flutter_app/app.dart';
import 'package:flutter_app/presenter/cucco_game_master.dart';
import 'package:flutter_app/repository/setting_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  /// ゲームマスター
  CuccoGameMaster _gameMaster;
  /// ゲーム画面のビューのモック
  CuccoGameView _mockView;
  /// 設定リポジトリ
  SettingRepository _repository;

  setUp(() {
    _gameMaster = CuccoGameMaster();
    /// ビューのモック化
    _mockView = MockCuccoGameView();
    _gameMaster.setView(_mockView);
  });

  test('セットアップを要求されると、設定リポジトリに保存されているnpcの人数をビューに伝える', () {
    _gameMaster.GameSetUp();

    verify(_mockView.setEndNpcId(5));
  });
}

/// 設定リポジトリのモック
class MockSettingRepository extends Mock implements SettingRepository {}
/// ビューのモック
class MockCuccoGameView extends Mock implements CuccoGameView {}