import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'dart:ui' as ui;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Cucco()
    );
  }
}

class CuccoState extends State<Cucco> {
  // アクティブ状態のボタンのレイアウトファイルの名前
  static const String VALID_BUTTON_FILE_NAME = 'res/images/button_default.png';

  // 非アクティブ状態のボタンのレイアウトファイルの名前
  static const String INVALID_BUTTON_FILE_NAME = 'res/images/button_push.png';

  // アクティブ状態のククボタンのレイアウトファイルの名前
  static const String CUCCO_BUTTON_FILE_NAME = 'res/images/button_cucco.png';

  // 周りの余白
  static const double AROUND_MARGIN = 30.0;

  // 「交換する」ボタンのレイアウトファイルの名前
  String changeButtonLayoutName = 'res/images/button_default.png';

  // 「交換しない」ボタンのレイアウトファイルの名前
  String noChangeButtonLayoutName = 'res/images/button_default.png';

  // ククボタンのレイアウトファイルの名前
  String cuccoButtonLayoutName = 'res/images/button_cucco.png';

  // npcの人数
  int endNpcId = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _mainCuccoLayout(),
    );
  }


  // 画面全体のレイアウト
  Widget _mainCuccoLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        // npcのレイアウト
        Expanded(
            flex: 1,
            child: _npcLayout()
        ),

        // ユーザーのレイアウト
        Expanded(
            flex: 1,
            child: _userLayout()
        ),
      ],
    );
  }

  // npcのレイアウト
  Widget _npcLayout() {
    return _oneNpcLayout();
  }

  // npc一人分のレイアウト
  Widget _oneNpcLayout() {
    final int maxRow = (endNpcId / 2.0).round();
    return Container(
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                // 背景
                Container(
                  child: Image.asset(
                      'res/images/background.png', fit: BoxFit.fill),
                ),
                Container(
                  padding: EdgeInsets.all(AROUND_MARGIN / maxRow),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: Image.asset(
                              'res/images/one.png', fit: BoxFit.contain)
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'res/images/flandre_normal_face.png',
                              fit: BoxFit.fill,
                            ),
                            Text(
                                '100Coins', textAlign: TextAlign.right,
                                style: TextStyle(fontSize: 10 * ui.window.devicePixelRatio)),

                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
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
                      flex: 1,
                      child: _userLayoutLeft()
                  ),
                  Expanded(
                      flex: 1,
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
                              changeButtonLayoutName =
                                  INVALID_BUTTON_FILE_NAME;
                            } else {
                              changeButtonLayoutName =
                                  VALID_BUTTON_FILE_NAME;
                            }
                          });
                        },
                        child: _sizedBoxForButton(
                            changeButtonLayoutName, "交換する", null)
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
                              noChangeButtonLayoutName =
                                  INVALID_BUTTON_FILE_NAME;
                            } else {
                              noChangeButtonLayoutName =
                                  VALID_BUTTON_FILE_NAME;
                            }
                          });
                        },
                        child: _sizedBoxForButton(
                            noChangeButtonLayoutName, "交換しない", null)
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
                              cuccoButtonLayoutName =
                                  INVALID_BUTTON_FILE_NAME;
                            } else {
                              cuccoButtonLayoutName =
                                  CUCCO_BUTTON_FILE_NAME;
                            }
                          });
                        },
                        child: _sizedBoxForButton(
                            cuccoButtonLayoutName, "クク", TextStyle(
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
}

class Cucco extends StatefulWidget {
  @override
  CuccoState createState() => new CuccoState();
}
