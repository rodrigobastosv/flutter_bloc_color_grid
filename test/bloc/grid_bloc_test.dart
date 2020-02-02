import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc_color_grid/bloc/bloc.dart';
import 'package:test/test.dart';

import '../mock.dart';

void main() {
  group('GridBloc', () {
    GridBloc gridBloc;
    MockGridHelper mockGridHelper;

    setUp(() {
      mockGridHelper = MockGridHelper();
      gridBloc = GridBloc(mockGridHelper);
    });

    blocTest(
      'Initial state should be InitialGridState',
      build: () => gridBloc,
      expect: [
        InitialGridState(),
      ],
    );

    blocTest(
      'should yield AddedTileGridState after emiting AddTileGridEvent',
      build: () => gridBloc,
      act: (bloc) => bloc.add(AddTileGridEvent()),
      expect: [
        InitialGridState(),
        isA<AddedTileGridState>(),
      ],
    );

    blocTest(
      'should yield RemovedTileGridState after emiting RemoveTileGridEvent',
      build: () => gridBloc,
      act: (bloc) {
        bloc.add(AddTileGridEvent());
        bloc.add(AddTileGridEvent());
        bloc.add(RemoveTileGridEvent(0));
        return;
      },
      expect: [
        InitialGridState(),
        isA<AddedTileGridState>(),
        isA<AddedTileGridState>(),
        isA<RemovedTileGridState>(),
      ],
    );

    blocTest(
      'should yield NoTileLeftGridState after emiting RemoveTileGridEvent and no more tiles left',
      build: () => gridBloc,
      act: (bloc) {
        bloc.add(AddTileGridEvent());
        bloc.add(RemoveTileGridEvent(0));
        return;
      },
      expect: [
        InitialGridState(),
        isA<AddedTileGridState>(),
        NoTileLeftGridState(),
      ],
    );
  });
}
