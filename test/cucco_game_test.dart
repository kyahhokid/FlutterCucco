import 'package:flutter_app/app.dart';
import 'package:flutter_app/presenter/cucco_game_master.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  /// ゲームマスターのモック
  CuccoGameMaster mockGameMaster;

  setUp(() {
    /// ゲームマスターのモック化
    mockGameMaster = MockGameMaster();
    CuccoGameMasterMaker.makeThenReturn(mockGameMaster);
  });

  testWidgets('ゲーム画面が表示されると、プレゼンターにゲームのセットアップを依頼する。', (WidgetTester tester) async {
    await tester.pumpWidget(CuccoApp());

    verify(mockGameMaster.GameSetUp());
  });

  testWidgets('npcの人数がセットされると、人数分のnpcを表示する。', (WidgetTester tester) async {
    CuccoApp cuccoApp = CuccoApp();
    CuccoState view;
    await tester.pumpWidget(cuccoApp);

    view = cuccoApp.cucco.cuccoState;
    view.setEndNpcId(5);
    await tester.pump();

    expect(find.byKey(CUCCO_GAME_NPC_VIEW_KEY), findsNWidgets(5));
  });
}

/// ゲームマスターのモック
class MockGameMaster extends Mock implements CuccoGameMaster {}