import 'package:flutter_app/data/Card.dart';
import 'package:flutter_app/model/card_pool.dart';
import 'package:test/test.dart';

// カードプール
CardPool cardPool;

void main() {

  setUp(() {
    cardPool = CardPool();
  });

  test('カードプールを作成すると山札が40枚になっている',() {
    expect(cardPool.getDeckSize(), 40);
  });

  test('カードプールを作成すると捨て札が0枚になっている',() {
    expect(cardPool.getDisCardList(), isEmpty);
  });

  test('カードを引くとランダムでカードを取り出せる',() {
    expect(cardPool.draw(), isNotNull);
  });

  test('カードを引くと山札の枚数が一枚減っている',() {
    cardPool.draw();

    expect(cardPool.getDeckSize(), 39);
  });

  test('カードを捨てると捨てたカードの一覧を確認できる',() {
    cardPool.disCard(Card.ONE);
    cardPool.disCard(Card.TWO);
    cardPool.disCard(Card.THREE);

    List<Card> disCardList = cardPool.getDisCardList();
    expect(disCardList.length, 3);
    expect(disCardList[0], Card.ONE);
    expect(disCardList[1], Card.TWO);
    expect(disCardList[2], Card.THREE);
  });

  test('山札と捨て札が存在する状態でリフレッシュすると捨て札が0枚になっている',() {
    thirtyCardDraw();
    expect(cardPool.getDeckSize(), 10);
    setDisCard();
    expect(cardPool.getDisCardList().length, 20);

    cardPool.refresh();
    expect(cardPool.getDisCardList().length, 0);
  });

  test('山札と捨て札が存在する状態でリフレッシュすると捨て札だったカードが山札に入っている',() {
    thirtyCardDraw();
    expect(cardPool.getDeckSize(), 10);
    setDisCard();
    expect(cardPool.getDisCardList().length, 20);

    cardPool.refresh();
    expect(cardPool.getDeckSize(), 30);
  });

  test('山札が0枚かつ、捨て札が存在する状態でカードを引くとランダムでカードを取り出せる',() {
    allCardDraw();
    expect(cardPool.getDeckSize(), 0);
    setDisCard();
    expect(cardPool.getDisCardList().length, 20);

    expect(cardPool.draw(), isNotNull);
  });

  test('山札が0枚かつ、捨て札が存在する状態でカードを引くと捨て札が0枚になっている',() {
    allCardDraw();
    expect(cardPool.getDeckSize(), 0);
    setDisCard();
    expect(cardPool.getDisCardList().length, 20);

    cardPool.draw();
    expect(cardPool.getDisCardList().length, 0);
  });

  test('山札が0枚かつ、捨て札が存在する状態でカードを引くと捨て札だったカードが山札になっている',() {
    allCardDraw();
    expect(cardPool.getDeckSize(), 0);
    setDisCard();
    expect(cardPool.getDisCardList().length, 20);

    cardPool.draw();
    expect(cardPool.getDeckSize(), 19);
  });
}

/// 山札から全てのカードを引く。
allCardDraw() {
  while(cardPool.getDeckSize() != 0) {
    cardPool.draw();
  }
}

/// 山札からカードを30枚引く。
thirtyCardDraw() {
  for(int i = 0; i < 30; i++) {
    cardPool.draw();
  }
}

/// カードを20枚捨てる。
setDisCard() {
  Card.values.forEach((Card card) {
    cardPool.disCard(card);
  });
}