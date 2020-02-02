import 'package:flutter/material.dart';
import 'package:flutter_bloc_color_grid/widget/no_tile_left_widget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NoTileLeftWidget tests', () {
    testWidgets(
        'should show "All the Tiles were removed. Tap on the FAB to add one." message',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: NoTileLeftWidget(),
        ),
      );
      final textFinder =
          find.text('All the Tiles were removed. Tap on the FAB to add one.');
      expect(textFinder, findsOneWidget);
    });
  });
}
