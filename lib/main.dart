import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/app.dart';

import 'package:flutter_app/presenter/cucco_game_master.dart';
import 'package:flutter_app/setting.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
            appBar: AppBar(
              title: Text('Startup NameGenerator'),
            ),
            body: MainBody()
        ),
        routes: <String, WidgetBuilder> {
          '/setting': (BuildContext context) => new SettingPage(),
        }

    );
  }
}

class MainBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainBodyState();
}

class MainBodyState extends State<MainBody> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        RaisedButton(
          child: Text("ゲームスタート"),
          onPressed: _transitionCucco,
        ),
        RaisedButton(
          child: Text("設定"),
          onPressed: () {
            Navigator.pushNamed(context,'/setting');
          },
        )
      ],
    );
  }

  void _transitionCucco() {
    Navigator.push(
        context,
        MaterialPageRoute(
        builder: (context) => CuccoApp()),
    );
  }
}