import 'package:flutter_app/presenter/setting_presenter.dart';
import 'package:flutter_app/repository/setting_repository.dart';
import 'package:flutter_app/setting.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  /// 設定画面のプレゼンター
  SettingPresenter _presenter;
  /// 設定リポジトリのモック
  SettingRepository _mockRepository;
  /// 設定画面のビューのモック
  SettingView _mockView;

  setUp(() {
    /// リポジトリのモック化
    _mockRepository = MockSettingRepository();
    /// プレゼンターのモック化
    _presenter = SettingPresenter(_mockRepository);
    /// ビューのモック化
    _mockView = MockSettingView();
    _presenter.setView(_mockView);
  });

  test('npcの人数の保存を要求されると、リポジトリにnpcの人数を保存する', () {
    _presenter.saveEndNpcId(5);

    verify(_mockRepository.saveEndNpcId(5));
  });

  test('設定データの読み込みを要求されると、リポジトリに保存されている設定データをビューに表示させる。',  () async {
    when(_mockRepository.getEndNpcId()).thenAnswer((_) => Future.value(5));

    await _presenter.loadSettingData();

    verify(_mockView.showEndNpcId(5));
  });
}

/// 設定リポジトリのモック
class MockSettingRepository extends Mock implements SettingRepository {}
/// ビューのモック
class MockSettingView extends Mock implements SettingView {}