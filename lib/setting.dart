import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/app.dart';

import 'package:flutter_app/presenter/cucco_game_master.dart';
import 'package:flutter_app/presenter/setting_presenter.dart';
/// npcの人数を選択するボタンのキー
const Key SETTING_END_NPC_DROPDOWN_BUTTON_KEY = Key('setting-end-npc-dropdown-button');

/// 設定画面
class SettingPage extends StatelessWidget {
  /// 設定画面のBodyのwidget
  final SettingBody settingBody = new SettingBody();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () { Navigator.of(context).pop(); },
              ),
              title: Text('設定'),
            ),
            body: settingBody
        ),
    );
  }
}

/// 設定画面のBodyのwidget
class SettingBody extends StatefulWidget {
  /// 設定画面のビュー
  SettingBodyState settingView;

  @override
  State<StatefulWidget> createState(){
    settingView = SettingBodyState();
    return settingView;
  }
}

/// 設定画面のビュー
class SettingBodyState extends State<SettingBody> implements SettingView {
  /// npnの人数
  String endNpcIdValue = "1";
  /// npcの人数の選択肢
  List<DropdownMenuItem<String>> _endNpcIdItems;
  /// プレゼンター
  SettingPresenter _presenter;

  @override
  void initState() {
    super.initState();
    _presenter = SettingPresenterMaker.make();
    _endNpcIdItems = _createEndNpcIdItems();
    _presenter.setView(this);
    _presenter.loadSettingData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        ListTile(
          title: Text("NPCの人数"),
          trailing: DropdownButton<String>(
              key: SETTING_END_NPC_DROPDOWN_BUTTON_KEY,
              value: endNpcIdValue, items: _endNpcIdItems, onChanged: ((String newValue) {
            setState(() {
              endNpcIdValue = newValue;
              _presenter.saveEndNpcId(int.parse(newValue));
            });
          })),
        )
      ],
    );
  }

  /// npcの人数の選択肢を作成する。
  List<DropdownMenuItem<String>> _createEndNpcIdItems(){
    /// npcの人数の選択肢
    List<DropdownMenuItem<String>> items = new List();

    for(int item = 1; item <= 14; item++) {
      items.add(new DropdownMenuItem<String>(
        value: item.toString(),
        child: Text(item.toString())
      ));
    }
    return items;
  }

  @override
  showEndNpcId(int endNpcId) {
    setState(() {
      endNpcIdValue = endNpcId.toString();
    });
  }
}

/// 設定画面のビューのインターフェイス
class SettingView {
  showEndNpcId(int endNpcId){}
}