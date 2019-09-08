import 'package:flutter_app/data/card.dart';
import 'dart:math' as math;

/// カードプール
///
/// 山札と捨て札を扱う
class CardPool {
  /// 山札
  List<Card> _deck = new List();
  /// 捨て札
  List<Card> _disCardList = new List();
  /// 乱数
  var _random = new math.Random();

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
  List<Card> getDisCardList() {
    return _disCardList;
  }

  /// 山札からカードを引く。
  ///
  /// 山札が0枚だったらリフレッシュする。
  Card draw() {
    if(_deck.isEmpty) {
      refresh();
    }
    return _deck.removeAt(_random.nextInt(_deck.length));
  }

  /// カードを捨てる。
  disCard(Card card) {
    _disCardList.add(card);
  }

  /// 捨て札のリストを取得する。
  refresh() {
    _deck.addAll(_disCardList);
    _disCardList.clear();
  }
}