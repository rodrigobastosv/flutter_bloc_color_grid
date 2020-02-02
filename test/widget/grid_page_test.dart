import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_color_grid/bloc/bloc.dart';
import 'package:flutter_bloc_color_grid/main.dart';
import 'package:flutter_bloc_color_grid/utils/grid_helper.dart';
import 'package:flutter_bloc_color_grid/widget/initial_state_widget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GridPage tests', () {
    testWidgets(
      'build without breaking',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: BlocProvider<GridBloc>(
              create: (_) => GridBloc(GridHelper()),
              child: GridPage(),
            ),
          ),
        );
      },
    );

    testWidgets(
      'show InitialStateWidget at start',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: BlocProvider<GridBloc>(
              create: (_) => GridBloc(GridHelper()),
              child: GridPage(),
            ),
          ),
        );

        expect(find.byType(InitialStateWidget), findsOneWidget);
      },
    );

    testWidgets(
      'shows one tile when tapped the fab one time',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: BlocProvider<GridBloc>(
              create: (_) => GridBloc(GridHelper()),
              child: GridPage(),
            ),
          ),
        );
        final fab = find.byType(FloatingActionButton);
        expect(fab, findsOneWidget);
        await tester.tap(fab);
        await tester.pumpAndSettle();
        expect(find.byType(TileWidget), findsOneWidget);
      },
    );

    testWidgets(
      'shows two tiles when tapped the fab two times',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: BlocProvider<GridBloc>(
              create: (_) => GridBloc(GridHelper()),
              child: GridPage(),
            ),
          ),
        );
        final fab = find.byType(FloatingActionButton);
        expect(fab, findsOneWidget);
        await tester.tap(fab);
        await tester.tap(fab);
        await tester.pumpAndSettle();
        expect(find.byType(TileWidget), findsNWidgets(2));
      },
    );

    testWidgets(
      'removes the tile when clicked on it',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: BlocProvider<GridBloc>(
              create: (_) => GridBloc(GridHelper()),
              child: GridPage(),
            ),
          ),
        );
        final fab = find.byType(FloatingActionButton);
        expect(fab, findsOneWidget);
        await tester.tap(fab);
        await tester.tap(fab);
        await tester.pumpAndSettle();
        final tiles = find.byType(TileWidget);
        expect(tiles, findsNWidgets(2));
        await tester.tap(tiles.at(0));
        await tester.pumpAndSettle();
        await tester.tap(tiles.at(0));
        await tester.pumpAndSettle();
        expect(find.byType(TileWidget), findsNothing);
      },
    );
  });
}
