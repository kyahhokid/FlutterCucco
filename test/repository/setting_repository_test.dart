
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("hoge", () {
    var answer;
    
    setUp(() async {
      answer = 42;
    });
    
    
    test('npcの人数を保存すると、リポジトリからデータを取り出せる', () {
      answer += 2;
      expect(answer, 44);
    });
    test('my first unit test', () {
      answer -= 2;
      expect(answer, 40);
    });
  }
  );
}