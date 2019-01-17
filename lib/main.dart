import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/app.dart';

import 'package:flutter_app/model/cucco_game_master.dart';
import 'package:scoped_model/scoped_model.dart';

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
          '/cucco': (BuildContext context) => ScopedModel<CuccoGameMaster>(
              model: CuccoGameMaster(),
              child: CuccoApp()
          ),
        }
    );
  }
}

class MainBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainBodyState();
}

class MainBodyState extends State<MainBody> {

  String _value = "1";
  List<DropdownMenuItem<String>> _items;

  @override
  Widget build(BuildContext context) {
    _items = createItems();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        ListTile(
            title: Text("NPCの人数"),
            trailing: DropdownButton<String>(value: _value, items: _items, onChanged: ((String newValue) {
              setState(() {
                _value = newValue;
              });
            })), 
        ),
        RaisedButton(
          child: Text("ゲームスタート"),
          onPressed: _transitionCucco,
        )
      ],
    );
  }

  List<DropdownMenuItem<String>> createItems(){
    List<DropdownMenuItem<String>> items = new List();

    for(int i = 1; i <= 14; i++) {
      items.add(new DropdownMenuItem<String>(
        value: i.toString(),
        child: Text(i.toString())
      ));
    }
    return items;
  }

  void _transitionCucco() {
    Navigator.pushNamed(context,'/cucco');
  }
}