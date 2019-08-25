import 'package:flutter/material.dart';
import 'package:flutter_app/presenter/setting_presenter.dart';
import 'package:flutter_app/setting.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  /// 設定画面のプレゼンターのモック
  SettingPresenter mockPresenter;

  setUp(() {
    /// プレゼンターのモック化
    mockPresenter = MockSettingPresenter();
    SettingPresenterMaker.makeThenReturn(mockPresenter);
  });

  testWidgets('設定画面が表示されると、プレゼンターに設定データの読み込みを依頼する。', (WidgetTester tester) async {
    await tester.pumpWidget(SettingPage());

    verify(mockPresenter.loadSettingData());
  });

  testWidgets('npcの人数がセットされると、プレゼンターにnpcの人数の保存を依頼する。', (WidgetTester tester) async {
    await tester.pumpWidget(SettingPage());
    await tester.tap(find.byKey(SETTING_END_NPC_DROPDOWN_BUTTON_KEY));
    await tester.pumpAndSettle();
    await tester.tap(find.text('7').last);

    verify(mockPresenter.saveEndNpcId(7));
  });
  
  testWidgets('npcの人数の表示を行うと、npcの人数の値をセットする。', (WidgetTester tester) async {
    SettingPage settingPage = SettingPage();
    SettingBodyState view;
    await tester.pumpWidget(settingPage);

    view = settingPage.settingBody.settingView;
    view.showEndNpcId(5);
    await tester.pump();

    expect(settingPage.settingBody.settingView.endNpcIdValue, '5' );
  });
}

/// プレゼンターのモック
class MockSettingPresenter extends Mock implements SettingPresenter {}