import 'package:flutter_app/app.dart';
import 'package:flutter_app/model/player.dart';
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
  SettingRepository _mockRepository;

  setUp(() {
    /// 設定リポジトリ
    _mockRepository = MockSettingRepository();
    /// ビューのモック化
    _mockView = MockCuccoGameView();
    /// ゲームマスターの生成
    _gameMaster = CuccoGameMaster(_mockRepository);
    _gameMaster.setView(_mockView);
  });

  test('セットアップを要求されると、設定リポジトリに保存されているnpcの人数をビューに伝える', () async {
    when(_mockRepository.getEndNpcId()).thenAnswer((_) => Future.value(5));

    await _gameMaster.GameSetUp();

    verify(_mockView.setEndNpcId(5));
  });

  test('セットアップを要求されると、キャラクターをランダムに決定してビューに表示させる', () async {
    when(_mockRepository.getEndNpcId()).thenAnswer((_) => Future.value(5));

    await _gameMaster.GameSetUp();

    List<Player> playerList = verify(_mockView.setPlayerList(captureAny)).captured.single;
    expect(playerList.length, 6);
  });
}

/// 設定リポジトリのモック
class MockSettingRepository extends Mock implements SettingRepository {}
/// ビューのモック
class MockCuccoGameView extends Mock implements CuccoGameView {}