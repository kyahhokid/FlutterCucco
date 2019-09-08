import 'package:flutter_app/data/card.dart';
import 'package:flutter_app/data/character.dart';

/// プレイヤー
class Player {
  /// 自分のキャラクター
  Character _myCharacter;
  /// 所持カード
  Card _myCard;

  /// コンストラクタ
  Player(this._myCharacter);
}