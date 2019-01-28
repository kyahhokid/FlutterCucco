
import 'package:flutter_app/repository/db_helper.dart';
import 'package:flutter_app/repository/setting_repository.dart';
import 'package:test/test.dart';
import 'package:flutter_driver/flutter_driver.dart';

void main() {
  SettingRepository _settingRepository;
  FlutterDriver driver;

  setUp(() async {
    driver = await FlutterDriver.connect(dartVmServiceUrl: 'https://dart-lang.github.io/observatory/');
    DBHelper.setIsTesting(true);
    _settingRepository = SettingRepository();
  });

  tearDownAll(() async {
    if (driver != null) {
      // Closes the connection
      driver.close();
    }
  });

  test('npcの人数を保存すると、リポジトリからそのデータを取り出せる', () async {
    await _settingRepository.saveEndNpcId(3);

    int value = await _settingRepository.getEndNpcId();
    expect(value, 3);
  });

  test('リポジトリにデータが保存されている状態で、新しくnpcの人数を保存すると、データが上書きされる', () {

  });

  test('リポジトリにデータが保存されていない状態で、リポジトリからnpcの人数を取り出すと、リポジトリから「1」を取り出せる', () {

  });

  test('リポジトリにデータを保存して、リポジトリのインスタンスを再生成しても、リポジトリからそのデータを取り出せる', () {

  });
}
