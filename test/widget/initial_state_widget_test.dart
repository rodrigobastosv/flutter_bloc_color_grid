import 'package:flutter/material.dart';
import 'package:flutter_bloc_color_grid/widget/initial_state_widget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('InitialStateWidget tests', () {
    testWidgets('should show "Add a beautifull Tile" message',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: InitialStateWidget(),
        ),
      );
      final textFinder = find.text('Add a beautifull Tile');
      expect(textFinder, findsOneWidget);
    });
  });
}
