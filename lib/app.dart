import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter_app/presenter/cucco_game_master.dart';

/// npcのビューのキー
const Key CUCCO_GAME_NPC_VIEW_KEY = Key('cucco_game_npc_view');

/// ゲーム画面
class CuccoApp extends StatelessWidget {
  Cucco cucco = Cucco();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: cucco
    );
  }
}

/// ゲーム画面のビュー
class CuccoState extends State<Cucco> implements CuccoGameView {
  // アクティブ状態のボタンのレイアウトファイルの名前
  static const String VALID_BUTTON_FILE_NAME = 'res/images/button_default.png';

  // 非アクティブ状態のボタンのレイアウトファイルの名前
  static const String INVALID_BUTTON_FILE_NAME = 'res/images/button_push.png';

  // アクティブ状態のククボタンのレイアウトファイルの名前
  static const String CUCCO_BUTTON_FILE_NAME = 'res/images/button_cucco.png';

  // 周りの余白
  static const double AROUND_MARGIN = 30.0;

  // ゲームマスター
  CuccoGameMaster _gameMaster;

  // 「交換する」ボタンのレイアウトファイルの名前
  String _changeButtonLayoutName = 'res/images/button_default.png';

  // 「交換しない」ボタンのレイアウトファイルの名前
  String _noChangeButtonLayoutName = 'res/images/button_default.png';

  // ククボタンのレイアウトファイルの名前
  String _cuccoButtonLayoutName = 'res/images/button_cucco.png';

  // npcの人数
  int _endNpcId = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _mainCuccoLayout(),
    );
  }

  @override
  void initState() {
    super.initState();
    /// ゲームマスターの作成
    _gameMaster = CuccoGameMasterMaker.make();
    _gameMaster.setView(this);
    /// ゲームマスターにゲームのセットアップを依頼する。
    _gameMaster.GameSetUp();
  }

  // 画面全体のレイアウト
  Widget _mainCuccoLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        // npcのレイアウト
        Expanded(
            child: _npcLayout()
        ),

        // ユーザーのレイアウト
        Expanded(
            child: _userLayout()
        ),
      ],
    );
  }

  // npcのレイアウト
  Widget _npcLayout() {
    double baseId = _endNpcId / 2.0 + 0.5;
    double deltaId = 0.5;
    List<Widget> rowWidgetList = new List();

    if(_endNpcId % 2 == 1) {
      rowWidgetList.add(new Expanded(child: _oneNpcLayout()));
      deltaId = 1.0;
    }

    while(baseId + deltaId <= _endNpcId) {
      Row row = new Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new Expanded(child: _oneNpcLayout()),
          new Expanded(child: _oneNpcLayout())
        ],
      );

      rowWidgetList.add(new Expanded(child: row));
      deltaId += 1.0;
    }

    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: rowWidgetList
    );
  }

  // npc一人分のレイアウト
  Widget _oneNpcLayout() {
    final int maxRow = (_endNpcId / 2.0).round();
    TextStyle textStyle = Theme.of(context).textTheme.headline;
    double horizontalPadding = _endNpcId == 1 ? AROUND_MARGIN : AROUND_MARGIN / 2;

    if(_endNpcId >= 7) {
      textStyle = Theme.of(context).textTheme.body1.apply(fontSizeFactor: 0.6);
    } else if(_endNpcId >= 2){
      textStyle = Theme.of(context).textTheme.body1;
    }

    return new Container(
      key: CUCCO_GAME_NPC_VIEW_KEY,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // 背景
          Container(
            child: Image.asset(
                'res/images/background.png', fit: BoxFit.fill),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: AROUND_MARGIN / maxRow, horizontal: horizontalPadding),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                    child: Container(
                      padding: EdgeInsets.only(right: 1.0),
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                          'res/images/one.png', fit: BoxFit.contain,),
                    )
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 1.0),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _npcFaceImage(),
                        Text(
                                '100Coins', style: textStyle, maxLines: 1,),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // npcの表情のレイアウト。
  // npcの人数に応じて、レイアウトの表示方法を変える。
  Widget _npcFaceImage() {
    if(_endNpcId <= 2) {
      return Image.asset(
        'res/images/flandre_normal_face.png',
        fit: BoxFit.contain,
      );
    } else {
      return Expanded(
        child: Image.asset(
          'res/images/flandre_normal_face.png',
          fit: BoxFit.contain,
        ),
      );
    }

  }

  // ユーザーのレイアウト
  Widget _userLayout() {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        // 背景
        Container(
          child: Image.asset('res/images/background.png',
            fit: BoxFit.fill,
          ),
        ),
        Column(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: _userLayoutTop()
            ),
            Expanded(
              flex: 9,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                      child: _userLayoutLeft()
                  ),
                  Expanded(
                      child: _userLayoutRight()
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ユーザーのレイアウトの上部
  Widget _userLayoutTop() {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 17,
              child: Container()
          ),
          Expanded(
              flex: 33,
              child: Text(
                  '山札残り40枚', textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 7.5 * ui.window.devicePixelRatio))
          ),
          Expanded(
            flex: 33,
            child: Text(
                '100Coins', textAlign: TextAlign.right,
                style: TextStyle(fontSize: 7.5 * ui.window.devicePixelRatio)),
          ),
          Expanded(
              flex: 17,
              child: Container()
          )
        ],
      ),
    );
  }

  // ユーザーのレイアウトの左部
  Widget _userLayoutLeft() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        // ユーザーのカード
        Expanded(
          flex: 8,
          child: Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(left: AROUND_MARGIN),
            child: Image.asset('res/images/one.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
        // ユーザーのカードの下の余白
        Expanded(
            flex: 1,
            child: Container()
        ),
      ],
    );
  }

  // ユーザーのレイアウトの右部
  Widget _userLayoutRight() {
    return Column(
      children: <Widget>[
        Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.only(
                  left: 15.0, right: AROUND_MARGIN),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: Container()
                  ),

                  // 「交換する」ボタン
                  Expanded(
                    flex: 3,
                    child: RawMaterialButton(
                        onPressed: () {},
                        onHighlightChanged: (isPressed) {
                          setState(() {
                            if (isPressed) {
                              _changeButtonLayoutName =
                                  INVALID_BUTTON_FILE_NAME;
                            } else {
                              _changeButtonLayoutName =
                                  VALID_BUTTON_FILE_NAME;
                            }
                          });
                        },
                        child: _sizedBoxForButton(
                            _changeButtonLayoutName, "交換する", null)
                    ),
                  ),

                  Expanded(
                      flex: 2,
                      child: Container()
                  ),

                  // 「交換しない」ボタン
                  Expanded(
                    flex: 3,
                    child: RawMaterialButton(
                        onPressed: () {},
                        onHighlightChanged: (isPressed) {
                          setState(() {
                            if (isPressed) {
                              _noChangeButtonLayoutName =
                                  INVALID_BUTTON_FILE_NAME;
                            } else {
                              _noChangeButtonLayoutName =
                                  VALID_BUTTON_FILE_NAME;
                            }
                          });
                        },
                        child: _sizedBoxForButton(
                            _noChangeButtonLayoutName, "交換しない", null)
                    ),
                  ),

                  Expanded(
                      flex: 2,
                      child: Container()
                  ),

                  // ククボタン
                  Expanded(
                    flex: 3,
                    child: RawMaterialButton(
                        onPressed: () {},
                        onHighlightChanged: (isPressed) {
                          setState(() {
                            if (isPressed) {
                              _cuccoButtonLayoutName =
                                  INVALID_BUTTON_FILE_NAME;
                            } else {
                              _cuccoButtonLayoutName =
                                  CUCCO_BUTTON_FILE_NAME;
                            }
                          });
                        },
                        child: _sizedBoxForButton(
                            _cuccoButtonLayoutName, "クク", TextStyle(
                            color: Color
                                .fromARGB(
                                255, 255,
                                255, 128),
                            fontWeight: FontWeight
                                .bold)
                        )
                    ),
                  ),

                  Expanded(
                      flex: 1,
                      child: Container()
                  ),
                ],
              ),
            )
        ),
        // ユーザーの顔
        Expanded(
          flex: 2,
          child: Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.only(
                left: 10.0, right: AROUND_MARGIN + 20.0, bottom: 10.0),
            child: Image.asset(
              'res/images/flandre_normal_face.png',
              fit: BoxFit.fill,
            ),
          ),
        )
      ],
    );
  }

  // ボタンレイアウト用のSizedBox
  SizedBox _sizedBoxForButton(String layout, String text,
      TextStyle style) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned.fill(
              child: Image.asset(
                  layout,
                  fit: BoxFit
                      .fill)),
          Positioned(
              child: FittedBox(
                fit: BoxFit
                    .scaleDown,
                alignment: Alignment
                    .center,
                child: Text(text, style: style),)
          )
        ],
      ),
    );
  }

  /// npcの人数をセットする。
  @override
  setEndNpcId(int endNpcId) {
    setState(() {
      this._endNpcId = endNpcId;
    });
  }
}

/// ゲーム画面のBodyのwidget
class Cucco extends StatefulWidget {
  CuccoState cuccoState = new CuccoState();

  @override
  CuccoState createState() => cuccoState;
}

/// ゲーム画面のビューのインターフェイス
class CuccoGameView {
  setEndNpcId(int endNpcId){}
}