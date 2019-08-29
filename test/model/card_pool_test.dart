import 'package:flutter_app/model/card_pool.dart';
import 'package:test/test.dart';
void main() {
  // カードプール
  CardPool cardPool;

  setUp(() {
    cardPool = CardPool();
  });

  test('カードプールを作成すると山札が40枚になっている',() {
    expect(cardPool.getDeckSize(), 40);
  });

  test('カードプールを作成すると捨て札が0枚になっている',() {
    expect(cardPool.getDisCardSize(), isEmpty);
  });

  test('カードを引くとランダムでカードを取り出せる',() {

  });

  test('カードを引くと山札の枚数が一枚減っている',() {

  });

  test('カードを捨てると捨てたカードの一覧を確認できる',() {

  });

  test('山札と捨て札が存在する状態でリフレッシュすると捨て札が0枚になっている',() {

  });

  test('山札と捨て札が存在する状態でリフレッシュすると捨て札だったカードが山札に入っている',() {

  });

  test('山札が0枚かつ、捨て札が存在する状態でカードを引くとランダムでカードを取り出せる',() {

  });

  test('山札が0枚かつ、捨て札が存在する状態でカードを引くと捨て札が0枚になっている',() {

  });

  test('山札が0枚かつ、捨て札が存在する状態でカードを引くと捨て札だったカードが山札になっている',() {

  });
}