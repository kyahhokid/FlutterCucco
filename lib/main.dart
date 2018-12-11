import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'dart:ui' as ui;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(
      title: 'Flutter Demo',
      home: Cucco()
    );
  }
}

class CuccoState extends State<Cucco> {
  static const String VALID_BUTTON_FILE_NAME = 'res/images/button_default.png';
  static const String INVALID_BUTTON_FILE_NAME = 'res/images/button_push.png';
  static const String CUCCO_BUTTON_FILE_NAME = 'res/images/button_cucco.png';

  String changeButtonLayoutName = 'res/images/button_default.png';
  String noChangeButtonLayoutName = 'res/images/button_default.png';
  String cuccoButtonLayoutName = 'res/images/button_cucco.png';

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
          child: new Stack(
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
                      child:
                      Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                                flex: 17,
                                child: Container()
                            ),
                            Expanded(
                                flex: 33,
                                child: Text(
                                    '山札残り40枚', textAlign: TextAlign.left)
                            ),
                            Expanded(
                              flex: 33,
                              child: Text(
                                  '100Coins', textAlign: TextAlign.right),
                            ),
                            Expanded(
                                flex: 17,
                                child: Container()
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 9,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                // ユーザーのカード
                                Expanded(
                                  flex: 8,
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    padding: EdgeInsets.only(left: 40.0),
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
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                    flex: 3,
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          left: 15.0, right: 40.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .stretch,
                                        children: <Widget>[
                                          Expanded(
                                            flex: 5,
                                            child: Container(),
                                          ),
                                          Expanded(
                                            flex: 20,
                                            child: RawMaterialButton(
                                                onPressed: () {},
                                                onHighlightChanged: (
                                                    isPressed) {
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

                                                child: SizedBox(
                                                  height: double.infinity,
                                                  width: double.infinity,
                                                  child: Stack(
                                                    fit: StackFit.expand,
                                                    children: <Widget>[
                                                      Positioned.fill(
                                                          child: Image.asset(
                                                              changeButtonLayoutName,
                                                              fit: BoxFit
                                                                  .fill)),
                                                      Positioned(
                                                          child: FittedBox(
                                                            fit: BoxFit
                                                                .scaleDown,
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                                '交換する'),)
                                                      )
                                                    ],
                                                  ),
                                                )
                                            ),
                                          ), Expanded(
                                            flex: 10,
                                            child: Container(),
                                          ), Expanded(
                                            flex: 20,
                                            child: RawMaterialButton(
                                                onPressed: () {},
                                                onHighlightChanged: (
                                                    isPressed) {
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

                                                child: SizedBox(
                                                  height: double.infinity,
                                                  width: double.infinity,
                                                  child: Stack(
                                                    fit: StackFit.expand,
                                                    children: <Widget>[
                                                      Positioned.fill(
                                                          child: Image.asset(
                                                              noChangeButtonLayoutName,
                                                              fit: BoxFit
                                                                  .fill)),
                                                      Positioned(
                                                          child: FittedBox(
                                                            fit: BoxFit
                                                                .scaleDown,
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                                '交換しない'),)
                                                      )
                                                    ],
                                                  ),
                                                )
                                            ),
                                          ), Expanded(
                                            flex: 10,
                                            child: Container(),
                                          ), Expanded(
                                            flex: 20,
                                            child: RawMaterialButton(
                                                onPressed: () {},
                                                onHighlightChanged: (
                                                    isPressed) {
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


                                                child: SizedBox(
                                                  height: double.infinity,
                                                  width: double.infinity,
                                                  child: Stack(
                                                    fit: StackFit.expand,
                                                    children: <Widget>[
                                                      Positioned.fill(
                                                          child: Image.asset(
                                                              cuccoButtonLayoutName,
                                                              fit: BoxFit
                                                                  .fill)),
                                                      Positioned(
                                                          child: FittedBox(
                                                            fit: BoxFit
                                                                .scaleDown,
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text('クク',
                                                              style: TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                      255, 255,
                                                                      255, 128),
                                                                  fontWeight: FontWeight
                                                                      .bold),),)
                                                      )
                                                    ],
                                                  ),
                                                )
                                            ),
                                          ),
                                          Expanded(
                                            flex: 5,
                                            child: Container(),
                                          )
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
                                        left: 10.0, right: 60.0, bottom: 10.0),
                                    child: Image.asset(
                                      'res/images/flandre_normal_face.png',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],


                ),


              ],
              fit: StackFit.expand
          ),
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
    return new LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          Size size = new Size(constraints.maxWidth, constraints.maxHeight);
          return Container(
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  // 背景
                  Container(
                    child: Image.asset('res/images/background.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.height / size.height * 40.0 /ui.window.devicePixelRatio),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Image.asset('res/images/one.png',
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  )
                ],
              )
          );
        }
    );
  }
}

class Cucco extends StatefulWidget {
  @override
  CuccoState createState() => new CuccoState();
}
