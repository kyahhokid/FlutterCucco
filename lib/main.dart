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

  runApp(
      ScopedModel<CuccoGameMaster>(
        model: CuccoGameMaster(),
        child: CuccoApp()
      )
  );
}