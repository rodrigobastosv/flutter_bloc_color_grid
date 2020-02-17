import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('FlutterBloc App', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });

    test('main test', () async {
      expect(driver.waitFor(find.byType('GridPage')), completes);
      await driver.waitFor(find.byType('FloatingActionButton'));
      await driver.tap(find.byType('FloatingActionButton'));
      await driver.waitUntilNoTransientCallbacks();
      await Future.delayed(Duration(seconds: 3));
      await driver.tap(find.byType('FloatingActionButton'));
      await driver.waitUntilNoTransientCallbacks();
      await Future.delayed(Duration(seconds: 3));

      await driver.tap(find.byValueKey(1));
      await driver.waitUntilNoTransientCallbacks();
      await Future.delayed(Duration(seconds: 3));
      await driver.tap(find.byValueKey(0));
      await driver.waitUntilNoTransientCallbacks();
      await Future.delayed(Duration(seconds: 3));
    });
  });
}
