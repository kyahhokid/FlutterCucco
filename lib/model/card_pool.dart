import 'package:flutter_app/data/Card.dart';

class CardPool {
  List<Card> _deck = new List();

  /// コンストラクタ
  CardPool() {
    _deck.addAll(Card.values);
    _deck.addAll(Card.values);
  }

  /// 山札の枚数を取得する。
  int getDeckSize() {
    return _deck.length;
  }

  /// 捨て札のリストを取得する。
  List<Card> getDisCardSize() {
    return _deck;
  }
}