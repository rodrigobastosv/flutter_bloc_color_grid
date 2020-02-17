import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_color_grid/bloc/bloc.dart';
import 'package:flutter_bloc_color_grid/model/tile.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../mock.dart';

void main() {
  group('GridBloc', () {
    GridBloc gridBloc;
    MockGridHelper mockGridHelper;
    Tile tile;
    List<Tile> tiles;

    setUp(() {
      tile = Tile(index: 0, color: Colors.red);
      tiles.add(tile);
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
      build: () {
        when(mockGridHelper.generateTile(any)).thenReturn(tile);
        return gridBloc;
      },
      act: (bloc) {
        bloc.add(AddTileGridEvent());
        return;
      },
      expect: [
        InitialGridState(),
        AddedTileGridState(tiles),
      ],
    );

    blocTest(
      'should yield RemovedTileGridState after emiting RemoveTileGridEvent',
      build: () {
        when(mockGridHelper.generateTile(any)).thenReturn(tile);
        tiles.add(tile);
        return gridBloc;
      },
      act: (bloc) {
        bloc.add(AddTileGridEvent());
        bloc.add(AddTileGridEvent());
        bloc.add(RemoveTileGridEvent(0));
        return;
      },
      expect: [
        InitialGridState(),
        AddedTileGridState(tiles),
        AddedTileGridState(tiles),
        RemovedTileGridState(tiles),
      ],
    );

    blocTest(
      'should yield NoTileLeftGridState after emiting RemoveTileGridEvent and no more tiles left',
      build: () {
        when(mockGridHelper.generateTile(any)).thenReturn(tile);
        return gridBloc;
      },
      act: (bloc) {
        bloc.add(AddTileGridEvent());
        bloc.add(RemoveTileGridEvent(0));
        return;
      },
      expect: [
        InitialGridState(),
        AddedTileGridState(tiles),
        NoTileLeftGridState(),
      ],
    );
  });
}
