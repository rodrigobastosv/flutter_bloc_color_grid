import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_color_grid/model/tile.dart';

import 'bloc.dart';

class GridBloc extends Bloc<GridEvent, GridState> {
  List<Tile> tiles;

  GridBloc() {
    tiles = [];
  }

  @override
  GridState get initialState => InitialGridState();

  @override
  Stream<GridState> mapEventToState(GridEvent event) async* {
    if (event is AddTileGridEvent) {
      final generatedTile = _generateTile();
      tiles.add(generatedTile);
      yield AddedTileGridState(tiles);
    }
    if (event is RemoveTileGridEvent) {
      tiles.removeAt(event.index);
      if (tiles.isEmpty) {
        yield NoTileLeftGridState();
      } else {
        yield RemovedTileGridState(tiles);
      }
    }
  }

  Tile _generateTile() {
    final randomColor = Color.fromRGBO(_generateRandomNumber(),
        _generateRandomNumber(), _generateRandomNumber(), 1.0);
    final listLength = tiles.length;

    return Tile(
      index: listLength,
      color: randomColor,
    );
  }

  int _generateRandomNumber() {
    Random random = Random();
    return random.nextInt(255);
  }
}
